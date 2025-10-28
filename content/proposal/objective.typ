= Objective
This thesis proposes transitioning from a suboptimal, per-user model to a shared, centralized architecture, as conceptualized in Figure 2, which decouples the IDE and centralizes the language server into a scalable, shared service. The overarching goal is to design, implement, and evaluate a shared language server architecture that significantly reduces resource consumption while maintaining a high-quality developer experience and ensuring strict user isolation. We achieve this through the following primary objectives:

1.  *Establish a Baseline "One-Pod-Per-User" Architecture.*
2.  *Develop a Shared JVM Architecture with User Isolation.*
3.  *Evaluate the Shared Architecture's Efficiency.*

== Establish a Baseline "One-Pod-Per-User" Architecture
The first technical objective is to re-architect the language server from an internal, per-IDE process to a centralized service. This project will externalize the Eclipse JDT Language Server from the Theia container into a standalone Java service on Kubernetes. This creates a "one-pod-per-user" architecture where each IDE pod communicates with its own dedicated language server pod over the network. This initial step is key to decoupling the components and preparing for a shared model.

Establishing this baseline is crucial for evaluating the final shared architecture. It provides a clear, measurable benchmark for performance and resource consumption in a decoupled but non-shared environment. This process involves addressing technical challenges such as container networking within Kubernetes and ensuring stable communication between the IDE and the now-external language server. The metrics collected from this baseline, particularly memory usage per user and request latency, will serve as the primary point of comparison to quantify the efficiency gains of the shared JVM model.

== Develop a Shared JVM Architecture with User Isolation
Building upon the baseline, this thesis will implement a working prototype of the *shared JVM model.* This service will accept connections from multiple Theia clients and spawn a logically separate and sandboxed language server session for each user, with all sessions co-existing within the same JVM process to minimize memory overhead. The final deliverable is a containerized service that integrates with the *Theia IDE*.

Security and stability are non-negotiable requirements for this architecture. A primary objective is to guarantee that the shared architecture provides strict logical isolation between user sessions @bargmann:2019:SurveySecureContainer. Under no circumstances should one user's actions, data, or potential crash impact any other user. This requires meticulous state management to ensure that all mutable, user-specific data (e.g., file contents, diagnostics) is sandboxed to its respective session @sun:2012:JVMPortableSandboxingJavas.

Furthermore, the entire system is designed with modularity in mind, relying heavily on well-defined interfaces. This architectural principle ensures that specific components, such as the session management strategy or the underlying communication protocol, can be replaced or upgraded in the future without requiring a complete system redesign. This focus on modularity is crucial for the long-term maintainability and evolution of the platform, enabling future extensions to support other language servers beyond Java.

== Evaluate the Shared Architecture's Efficiency
To validate the success of the proposed solution, we will conduct a quantitative evaluation. This objective focuses on measuring the improvements in resource consumption against any potential impact on user-perceived performance. The evaluation is performed using an existing benchmarking suite that simulates concurrent user workloads and captures detailed metrics from the system under test.

Key performance indicators (KPIs) will guide this analysis to ensure a data-driven conclusion. The primary KPIs include:
-   *RAM Consumption:* A quantifiable reduction in the average memory usage per user. The performance of the shared model is then benchmarked against the externalized "one-pod-per-user" baseline to measure the precise efficiency gains.
-   *CPU Utilization:* Average CPU usage under typical and peak load conditions.
-   *Responsiveness:* User experience must not be degraded. Industry standards suggest that UI feedback should remain below 500ms to feel fluid. This project aims to keep the latency for critical LSP operations (like code completion) consistently below a 300ms threshold, for a responsive feel to the user.