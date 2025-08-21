= Objective

The overarching goal of this thesis is to design, implement, and evaluate a shared language server architecture that significantly reduces resource consumption while maintaining a high-quality developer experience and ensuring strict user isolation. This will be achieved through the following primary objectives:

1.  *Design and Implement a Shared JVM Architecture for Java Language Servers.*
2.  *Ensure Strict User Isolation and System Modularity.*
3.  *Evaluate the Performance and Resource Efficiency of the Shared Architecture.*
4.  *Conduct a Feasibility Analysis of a True Multi-Tenant Language Server.*

== 1. Design and Implement a Shared JVM Architecture

The core technical objective is to build a working prototype of the shared JVM model. This involves externalizing the Eclipse JDT Language Server into a standalone Java service on Kubernetes, designed to accept connections from multiple Theia clients. This service will spawn a logically separate and sandboxed language server session for each user, with all sessions co-existing within the same JVM process to minimize memory overhead.

The implementation will include a proxy or dispatcher component to manage the lifecycle of user sessions and correctly route LSP messages. This component is critical for mapping incoming requests from a specific Theia client to its corresponding language server instance running within the shared process. The final deliverable will be a containerized service that can be deployed on the existing cluster and integrated with the Theia IDE frontend.

== 2. Ensure Strict User Isolation and System Modularity

Security and stability are non-negotiable requirements of this project. A primary objective is to guarantee that the shared architecture provides strict logical isolation between user sessions. Under no circumstances should one user's actions, data, or a potential crash impact any other user. This requires meticulous state management to ensure that all mutable, user-specific data (e.g., file contents, diagnostics) is sandboxed to its respective session @Efstathopoulos15.

Furthermore, the entire system will be designed with modularity in mind, relying heavily on well-defined interfaces. This architectural principle ensures that specific components, such as the session management strategy or the underlying communication protocol, can be replaced or upgraded in the future without requiring a full system redesign. This focus on modularity is crucial for the long-term maintainability and evolution of the platform.

== 3. Evaluate the Performance and Resource Efficiency of the Shared Architecture

To validate the success of the proposed solution, a rigorous and quantitative evaluation will be conducted. This objective focuses on measuring the improvements in resource consumption against any potential impact on user-perceived performance. The evaluation will be performed using an existing benchmarking suite, which can simulate concurrent user workloads and capture detailed metrics from the system under test.

This analysis will be guided by key performance indicators (KPIs) to ensure a data-driven conclusion. The primary KPIs include:
-   *RAM Consumption:* The average memory usage per user, with a target reduction of at least 60% compared to the baseline single-pod model.
-   *CPU Utilization:* Average CPU usage under typical and peak load conditions.
-   *Responsiveness:* Latency for critical LSP operations like code completion, with a target of remaining below 300ms to ensure a fluid user experience.

== 4. Conduct a Feasibility Analysis of a True Multi-Tenant Language Server

While the shared JVM model optimizes resources at the process level, a true multi-tenant language server could offer further gains by sharing in-memory project state. The final objective is to conduct a thorough feasibility study of this advanced architecture. This analysis will move beyond the prototype and explore the next frontier of optimization for this system.

This research will involve identifying the primary challenges, such as concurrency control for shared ASTs, efficient cache invalidation strategies, and the deep modifications required within the Eclipse JDT Language Server itself. The outcome will be a detailed report outlining a potential architectural design for a multi-tenant Java LS, an analysis of the engineering effort required, and a final recommendation on whether a full implementation would be a worthwhile future project.