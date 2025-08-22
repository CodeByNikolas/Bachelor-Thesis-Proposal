= Problem

The central problem with the current deployment architecture is its lack of resource efficiency and scalability. In the current setup, each user's Theia instance runs an *internal* Java Language Server within the same container. While simple to deploy, this tightly-coupled model creates a rigid, linear relationship between the number of concurrent users and the total resources consumed, leading to two significant inefficiencies.

First, this architecture prevents any form of resource sharing. The Java Virtual Machine (JVM) itself carries a substantial memory footprint. For a platform serving thousands of users, this results in thousands of JVMs running in parallel, consuming large amounts of memory. 

Second, since many students work on identical starter projects, each internal language server independently computes and stores nearly identical data structures like Abstract Syntax Trees (ASTs) and symbol indexes, leading to considerable data redundancy across the cluster @Barros22.

These inefficiencies have direct negative consequences. For the *university acting as the platform operator*, high resource consumption translates into increased infrastructure costs. For the *students*, high cluster load can lead to degraded performance, such as longer IDE startup times and noticeable latency. This thesis proposes transitioning from this suboptimal model to a shared, centralized architecture, as illustrated in Figure 1.

#figure(
  image("images/deployment-diagram.png", width: 80%),
  caption: [
    Deployment diagram illustrating the transition from the Current Architecture, where each container runs an internal and tightly-coupled language server, to the Proposed Shared Architecture, which decouples the IDE and centralizes the language server into a scalable, shared service.
  ],
) <fig:deployment-diagram>