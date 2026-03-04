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
  url: "https://zh.wikipedia.org/wiki/%E6%8B%93%E6%89%91%E7%A9%BA%E9%97%B4"
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

#let denseForSet = (
  optionLink("DenseSet", [稠密的]),
)

#let convergentForSeq = optionLink(
  "SeqConvergence",
  [收敛],
)

#let connected = optionLink(
  "Connected",
  [连通],
)

#let pathConnected = optionLink(
  "PathConnected",
  [道路连通],
)

// property:
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

// operator:
#let Nbr = body => [
  #optionLink("NeighborhoodFamily", $op("Nbr")$)#h(0.1em) (#body)
]

#let Interior = body => [
  #optionLink("Interior", $op("Int")$)#h(0.1em) (#body)
]

#let Closure = body => [
  #optionLink("Closure", $op("Cl")$)#h(0.1em) (#body)
]
