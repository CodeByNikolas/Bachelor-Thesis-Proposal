#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

= Problem

The primary problem with the current deployment architecture is its profound lack of resource efficiency at scale. By pairing each user's Theia instance with its own dedicated Java Language Server, the system creates a rigid, linear relationship between the number of concurrent users and total resource consumption. This architecture is plagued by two major inefficiencies: redundant process overhead and duplicated in-memory state, which together create a significant scalability bottleneck.

First, the Java Virtual Machine itself carries a substantial memory footprint before any application code is loaded. For a platform serving thousands of concurrent users, this results in thousands of JVMs running in parallel, consuming a vast amount of memory for what is largely redundant process management. Second, language servers build and maintain large data structures like Abstract Syntax Trees and symbol indexes in memory @Gupta20. Since many students work on identical starter projects, each language server independently computes and stores nearly identical project states, leading to massive data redundancy.

These inefficiencies have direct negative consequences for the platform's stakeholders. For the *university acting as the platform operator*, high resource consumption translates directly into increased infrastructure costs, limiting the number of students that can be supported simultaneously. For the *students*, high cluster load can lead to degraded performance, such as longer IDE startup times and noticeable latency in editor features, which negatively impacts their learning experience. Figure 1 illustrates the architectural shift proposed to solve this problem.

#figure(
  grid(columns: (1fr, 1fr), gutter: 2em)[
    // Column 1: Current Architecture
    block[
      strong[Current Architecture (one LS per pod)]
      #diagram(
        spacing: 2.5em,
        node((0,0), [Theia IDE 1]),
        node((1,0), [JDT LS 1]),
        edge((0,0), (1,0), "-|>"),
        node((0,1), [Theia IDE 2]),
        node((1,1), [JDT LS 2]),
        edge((0,1), (1,1), "-|>"),
        node((0,2), [Theia IDE N]),
        node((1,2), [JDT LS N]),
        edge((0,2), (1,2), "-|>")
      )
    ]
    // Column 2: Proposed Shared Architecture
    block[
      strong[Proposed Shared Architecture]
      #diagram(
        spacing: 2.5em,
        node((0,0), [Theia IDE 1]),
        node((0,1), [Theia IDE 2]),
        node((0,2), [Theia IDE N]),
        node((2,1), [Shared JDT LS Service], width: 10em),
        edge((0,0), (2,1), "-|>"),
        edge((0,1), (2,1), "-|>"),
        edge((0,2), (2,1), "-|>")
      )
    ]
  ],
  caption: [
    Deployment diagram comparing the current architecture, where each user pod contains an independent language server, with the proposed architecture, which centralizes the language server into a shared service.
  ],
) <fig:deployment-diagram>