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

// operator:
#let Nbr = body => [
  #optionLink("NeighborhoodFamily", $op("Nbr")$)#h(0.1em) (#body)
]

#let Interior = body => [
  #optionLink("Interior", $op("Int")$)#h(0.1em) (#body)
]
