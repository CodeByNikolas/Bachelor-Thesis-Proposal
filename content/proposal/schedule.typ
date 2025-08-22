= Schedule

The thesis work is planned over 5 months, starting on 15 September 2025, and concluding on 15 February 2026. The project will be structured into three main milestones, following an agile, iterative approach.

- *Milestone 1: Foundation and Service Externalization (Weeks 1-6)*
  - `Weeks 1-2:` In-depth research on LSP, JDT Language Server internals, and multi-tenant architectures. Set up development environments.
  - `Weeks 3-6:` Implement the externalization of the JDT Language Server into a standalone service. Establish a 1-to-1 connection between a Theia instance and the external service to create a performance baseline. (Objective 1, part 1)

- *Milestone 2: Shared JVM Implementation and Evaluation (Weeks 7-15)*
  - `Weeks 7-12:` Implement the core logic for the shared JVM architecture, including the proxy/dispatcher and session management. Ensure strict user isolation within the service. (Objective 1 part 2 & Objective 2)
  - `Weeks 13-15:` Integrate the shared language server with the benchmarking suite. Execute comprehensive performance and resource benchmarks against the baseline to validate KPIs. (Objective 3)

- *Milestone 3: Multi-Tenancy Analysis and Finalization (Weeks 16-22)*
  - `Weeks 16-19:` Conduct the feasibility study for the true multi-tenant language server. Research state-sharing strategies and concurrency models. Document the architectural challenges and potential designs. (Objective 4)
  - `Weeks 20-22:` Finalize the implementation, refine documentation, and incorporate feedback. This period serves as a buffer for addressing unforeseen issues and preparing the final thesis document.