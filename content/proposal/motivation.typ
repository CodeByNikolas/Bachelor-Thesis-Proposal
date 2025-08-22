= Motivation

This thesis aims to engineer a more scalable, cost-effective, and performant cloud development platform for education. By solving the core problem of resource inefficiency, this project will deliver operational benefits while advancing the scientific understanding of multi-tenant software architectures. The positive outcomes of this work will directly impact the platform's operators and end-users.

From an engineering and operational standpoint, the primary driver is *resource optimization and cost reduction*. Consolidating multiple language server instances into a shared JVM model can reduce the overall memory footprint. Instead of paying the memory cost of a JVM for every user, the platform pays it once for a shared service. This directly lowers operational costs and allows the platform to support more concurrent users on the same hardware, a critical factor for a growing student body @Leitner12b.

From the user's perspective, this work aims to *enhance the developer experience*. A more efficient backend reduces the likelihood of system-wide performance degradation under heavy load. A shared language server architecture can also enable faster session startup times. Since the shared JVM and core components would already be "warm," a new user session could become operational much faster than it would take to initialize a new pod and JVM from scratch, providing a more responsive experience.

Scientifically, this thesis is motivated by the opportunity to investigate the complex *trade-offs between user isolation and resource efficiency* in a stateful application. Applying multi-tenancy to a language server presents unique challenges in concurrency, state management, and security @Nguyen23. This work will explore practical architectural patterns for achieving these goals, contributing to the broader field of cloud-native software engineering @Laigner25, as conceptualized in Figure 2.

#figure(
  image("images/memory-model.png", width: 80%),
  caption: [
    Conceptual memory model for the shared JVM architecture. This model is key to the proposal's efficiency gains, as it allows the system to load common, read-only state (like library indexes) into memory only once, while guaranteeing that mutable, user-specific state remains strictly isolated within logically separate processes.
  ],
) <fig:memory-model>