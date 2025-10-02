= Problem
In the current setup, each user's Theia instance runs an *internal* Java Language Server within the same container. While simple to deploy, this tightly-coupled model, illustrated in Figure 1, creates a rigid, linear relationship between the number of concurrent users and the total resources consumed. This leads to two significant inefficiencies.

First, this architecture prevents any form of resource sharing. The Java Virtual Machine (JVM) itself carries a substantial memory footprint. For a platform serving thousands of users, this results in thousands of JVMs running in parallel, consuming large amounts of memory.

Second, since many students work on identical starter projects, each internal language server independently computes and stores nearly identical data structures like Abstract Syntax Trees (ASTs) and symbol indexes, leading to considerable data redundancy across the cluster @barros:2022:EditingSupportSoftware.

These inefficiencies have direct negative consequences. For the *university acting as the platform operator*, high resource consumption translates into increased infrastructure costs. For the *students*, high cluster load can lead to degraded performance, such as longer IDE startup times and noticeable latency. This thesis proposes transitioning from this suboptimal model to a shared, centralized architecture, as conceptualized in Figure 2, which decouples the IDE and centralizes the language server into a scalable, shared service.

#figure(
  image("images/current_architecture.png", width: 80%),
  caption: [
    UML component diagram of the *Current Architecture*. Each `Theia IDE Instance` contains its own internal and tightly-coupled `Internal LS` component. The required `LSP` interface of the GUI is satisfied by the provided interface of the language server within the same container.
  ],
) <fig:current-architecture>

#figure(
  image("images/proposed_architecture.png", width: 90%),
  caption: [
    UML component diagram of the *Proposed Shared Architecture*. Multiple `Theia IDE Instance` components act as clients to a single, centralized `Shared LS` component. They use the provided `LSP` interface, establishing a decoupled, scalable 1-to-N relationship.
  ],
) <fig:proposed-architecture>