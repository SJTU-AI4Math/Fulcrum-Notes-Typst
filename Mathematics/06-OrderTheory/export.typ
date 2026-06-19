#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let 预序结构 = optionLink(
  "Preorder",
  [预序结构],
)

#let 偏序结构 = optionLink(
  "PartialOrder",
  [偏序结构],
)

#let 全序结构 = optionLink(
  "TotalOrder",
  [全序结构],
)

#let 上界 = optionLink(
  "UpperBound",
  [上界],
)

#let 下界 = optionLink(
  "LowerBound",
  [下界],
)

#let 函数有界 = optionLink(
  "FunctionBounded",
  [有界],
)

#let 单调 = optionLink(
  "Monotone",
  [单调],
)

#let 上确界 = optionLink("Supremum", [上确界])
#let 下确界 = optionLink("Infimum", [下确界])
#let Sup = (S) => $#optionLink("Supremum", $op("Sup")$) #S$
#let Inf = (S) => $#optionLink("Infimum", $op("Inf")$) #S$

#let aleph0 = optionLink(
  "Aleph0",
  [$aleph_0$],
  url: "https://zh.wikipedia.org/wiki/%E9%98%BF%E5%88%97%E5%A4%AB%E6%95%B8"
)