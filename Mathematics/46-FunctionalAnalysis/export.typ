#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

// concept definition

#let nvs = (
  optionLink(
    "NVS",
    [赋范线性空间],
  )
)

#let bs = (
  optionLink(
    "BS",
    [Banach 空间],
  )
)

#let 有界线性算子 = (
  optionLink(
    "BoundedLinearOperator",
    [有界线性算子],
  )
)

// operator

#let Blo = (sour, targ) => [
  #optionLink("BoundedLinearOperator", $scr(B)$)#h(0.1fr) (#sour, #targ)
]
