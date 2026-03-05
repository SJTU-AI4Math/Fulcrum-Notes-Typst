#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

// hyperref:
#let topology = optionLink(
  "Topology",
  [拓扑],
)

#let ts = optionLink(
  "TopologicalSpace",
  [拓扑空间],
)

#let 拓扑空间 = optionLink(
  "TopologicalSpace",
  [拓扑空间],
  url: "https://zh.wikipedia.org/wiki/%E6%8B%93%E6%89%91%E7%A9%BA%E9%97%B4",
)

#let openSet = optionLink(
  "OpenSet",
  [开集],
)

#let closedSet = optionLink(
  "ClosedSet",
  [闭集],
)

#let neighborhood = optionLink(
  "Neighborhood",
  [邻域],
)

#let limitPoint = optionLink(
  "LimitPoint",
  [极限点],
)

#let convergentForSeq = optionLink(
  "SeqConvergence",
  [收敛],
)

#let connected = optionLink(
  "Connectedness",
  [连通],
)

#let pathConnected = optionLink(
  "PathConnectedness",
  [道路连通],
)

// property:
#let 稠密 = (
  optionLink("DenseSet", [稠密]),
)

#let 序列紧 = optionLink(
  "SequentialCompactness",
  [序列紧],
)

#let compact = optionLink(
  "Compactness",
  [紧致],
)

#let 可数紧 = optionLink(
  "CountableCompactness",
  [可数紧],
)

#let continuity = optionLink(
  "Continuity",
  [连续],
)

#let continuous = optionLink(
  "MapContinuity",
  [连续],
)

// instance:
#let 平凡拓扑 = optionLink(
  "TrivialTopology",
  [平凡拓扑],
)

#let 离散拓扑 = optionLink(
  "DiscreteTopology",
  [离散拓扑],
)

// operator:
#let Nbr = body => [
  #optionLink("NeighborhoodFamily", $op("Nbr")$)#h(0.1em) (#body)
]

#let DelNbr = body => [
  #optionLink("DeletedNeighborhood", $limits(op("Nbr"))^circle.tiny$)#h(0.1em) (#body)
]

#let Interior = body => [
  #optionLink("Interior", $op("Int")$)#h(0.1em) (#body)
]

#let Closure = body => [
  #optionLink("Closure", $op("Cl")$)#h(0.1em) (#body)
]

#let Cont = (sour, targ) => [
  #optionLink("MapContinuity", $op("C")$)#h(0.1fr) (#sour, #targ)
]
