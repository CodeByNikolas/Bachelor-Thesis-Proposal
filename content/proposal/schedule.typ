= Schedule

The thesis work is planned over a 5-month period, starting on February 3, 2025, and concluding on June 3, 2025. The project will be structured into three main milestones, following an agile, iterative approach to ensure consistent progress and measurable deliverables.

- *Milestone 1: Foundation and Service Externalization (Weeks 1-6)*
  - `Weeks 1-2:` In-depth research on LSP, JDT Language Server internals, and multi-tenant architectures. Set up development and testing environments.
  - `Weeks 3-4:` Implement the initial externalization of the JDT Language Server into a standalone, containerized Java service. Establish basic communication between a single Theia instance and the external service. (Objective 1)
  - `Weeks 5-6:` Develop the initial session management logic to handle multiple, independent connections, laying the groundwork for the shared JVM model.

- *Milestone 2: Shared JVM Implementation and Evaluation (Weeks 7-14)*
  - `Weeks 7-10:` Implement the core logic for the shared JVM architecture, ensuring strict user session isolation within the service. Refine the LSP message proxying and state management. (Objective 1 & 2)
  - `Weeks 11-12:` Integrate the shared language server with the existing benchmarking suite. Develop test scenarios simulating realistic concurrent user workloads. (Objective 3)
  - `Weeks 13-14:` Execute comprehensive performance and resource benchmarks. Analyze the data to compare the new architecture against the baseline and validate KPIs.

- *Milestone 3: Multi-Tenancy Analysis and Finalization (Weeks 15-20)*
  - `Weeks 15-17:` Conduct the feasibility study for the true multi-tenant language server. Research state-sharing strategies and concurrency models. Document the architectural challenges and potential designs. (Objective 4)
  - `Weeks 18-20:` Finalize the implementation, refine documentation, and incorporate feedback. This period also serves as a buffer for addressing any unforeseen issues and preparing the final thesis document.