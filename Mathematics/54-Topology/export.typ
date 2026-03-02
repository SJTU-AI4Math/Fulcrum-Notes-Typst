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

#let openSet = optionLink(
  "Open-Set",
  [开集],
)

#let closedSet = optionLink(
  "Closed-Set",
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

#let denseSet = optionLink(
  "DenseSet",
  [稠密集],
)

#let convergentForSeq = optionLink(
  "SeqConvergence",
  [收敛的],
)

#let 序列紧性 = optionLink(
  "SequentialCompactness",
  [序列紧性],
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
