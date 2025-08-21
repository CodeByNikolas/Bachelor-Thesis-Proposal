#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
= Motivation

The motivation for this thesis is to engineer a more scalable, cost-effective, and performant cloud development platform for education. By solving the core problem of resource inefficiency, this project will deliver significant operational benefits while also advancing the scientific understanding of multi-tenant software architectures. The positive outcomes of this work will directly impact the platform's operators and its end-users.

From an engineering and operational standpoint, the primary driver is *resource optimization and cost reduction*. Consolidating multiple language server instances into a shared JVM model can reduce the overall memory footprint by an order of magnitude. Instead of paying the memory cost of a JVM for every user, the platform pays it once for a shared service. This directly lowers operational costs and allows the platform to support more concurrent users on the same hardware, a critical factor for a growing student body @leitner12.

From the user's perspective, this work aims to *enhance the developer experience*. A more efficient backend reduces the likelihood of system-wide performance degradation under heavy load. A shared language server architecture can also enable faster session startup times. Since the shared JVM and core components would already be "warm," a new user session could become operational much faster than it would take to initialize a new pod and JVM from scratch, providing a more responsive experience.

Scientifically, this thesis is motivated by the opportunity to investigate the complex *trade-offs between user isolation and resource efficiency* in a stateful application. Applying multi-tenancy to a language server presents unique challenges in concurrency, state management, and security @Pala21. This work will explore practical architectural patterns for achieving logical isolation of user data while maximizing the sharing of common, read-only data, as conceptualized in Figure 2.

#figure(
  diagram(
    spacing: 2.5em,
    // Shared read-only state (center)
    node((0,0), [Shared Read-Only State], width: 12em),

    // Language server processes (right)
    node((3,-1), [JDT LS Process 1]),
    node((3,0), [JDT LS Process 2]),
    node((3,1), [JDT LS Process N]),

    // User-private states (left)
    node((-3,-1), [User 1 Private State]),
    node((-3,0), [User 2 Private State]),
    node((-3,1), [User N Private State]),

    // Accessed-by edges from shared state to processes
    edge((0,0), (3,-1), "-|>"),
    edge((0,0), (3,0),  "-|>"),
    edge((0,0), (3,1),  "-|>"),

    // Owned-by edges from private states to processes
    edge((-3,-1), (3,-1), "-|>"),
    edge((-3,0),  (3,0),  "-|>"),
    edge((-3,1),  (3,1),  "-|>")
  ),
  caption: [
    Conceptual memory model for the shared JVM architecture. Common, read-only state is shared across all user sessions, while user-specific state remains strictly isolated within logical processes.
  ],
) <fig:memory-model>