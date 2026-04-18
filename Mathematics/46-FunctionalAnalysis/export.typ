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

#let 有界线性泛函 = (
  optionLink(
    "BoundedLinearFunctional",
    [有界线性泛函],
  )
)

#let 半范数 = (
  optionLink(
    "Seminorm",
    [半范数],
  )
)

#let 次线性泛函 = (
  optionLink(
    "SublinearFunctional",
    [次线性泛函],
  )
)

#let 吸收集 = (
  optionLink(
    "AbsorbingSet",
    [吸收集],
  )
)

#let 均衡集 = (
  optionLink(
    "BalancedSet",
    [均衡集],
  )
)

#let 凸集 = (
  optionLink(
    "ConvexSet",
    [凸集],
  )
)

#let 绝对凸集 = (
  optionLink(
    "ABCSet",
    [绝对凸集],
  )
)

#let Minkowski = (
  optionLink(
    "MinkowskiFunctional",
    [Minkowski 泛函],
  )
)

// operator

#let Blo = (sour, targ) => [
  #optionLink("BoundedLinearOperator", $scr(B)$)#h(0.1fr) (#sour, #targ)
]

#let Spec = T => [
  #optionLink("Spectrum", $sigma$)#h(-0.1fr) (#T)
]
