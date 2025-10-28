= Schedule
The thesis work is planned to span five months, starting on 30 September 2025, and concluding on 15 February 2026. The project is structured following an agile, iterative approach.

- *Phase 1: Research and Setup (`Weeks 1-2`)*
  - Conduct in-depth research on the Language Server Protocol (LSP), JDT Language Server internals, and multi-tenant architectures.
  - Establish the complete development and testing environments.

- *Phase 2: Baseline Implementation (`Weeks 3-5`)*
  - Implement the externalization of the JDT Language Server into a standalone Kubernetes service.
  - Establish a 1-to-1 connection between a Theia IDE instance and the external service. (Objective 1)

- *Phase 3: Baseline Evaluation (`Weeks 6-7`)*
  - Integrate the baseline architecture with the benchmarking suite.
  - Execute performance and resource benchmarks to establish a clear performance baseline.

- *Phase 4: Shared JVM Core Implementation (`Weeks 8-12`)*
  - Develop the core logic for the shared JVM architecture, including the proxy/dispatcher and session management.
  - Implement strict user isolation mechanisms within the service. (Objective 2)

- *Phase 5: Integration and Benchmarking (`Weeks 13-17`)*
  - Integrate the complete shared language server with the Theia IDE and the benchmarking suite.
  - Execute comprehensive performance and resource benchmarks against the baseline to validate KPIs. (Objective 3)

- *Phase 6: Finalization and Documentation (`Weeks 18-22`)*
  - Finalize the implementation, refine the documentation, and incorporate feedback.
  - This period serves as a buffer for addressing any unforeseen issues and preparing the final thesis document.