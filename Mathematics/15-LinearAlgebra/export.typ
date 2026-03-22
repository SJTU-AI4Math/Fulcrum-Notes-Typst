#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

// 记号：dim 用 show；span、rank 非内置，直接定义命令
#let span = $#optionLink("Span", $op("span")$, url: "https://zh.wikipedia.org/wiki/%E7%BB%B4%E6%89%BF%E6%A0%BC")$
#let rank = $#optionLink("Rank", $op("rank")$, url: "https://zh.wikipedia.org/wiki/%E6%A7%A3_(%E7%B9%BC%E6%89%BF%E4%BB%A3%E6%95%B0)")$

#let dim = optionLink("Dimension", $op("dim")$, url: "https://zh.wikipedia.org/wiki/%E7%BB%B4%E6%95%B0")

#let LinearAlgebraStyle = body => {
  body
}

// 第一章：向量和线性空间

#let 线性空间 = optionLink(
  "LinearSpace",
  [线性空间],
  url: "https://zh.wikipedia.org/wiki/%E7%B9%BC%E6%89%BF%E6%95%B0%E5%AD%A6/%E7%BA%BF%E6%80%A7%E4%BB%A3%E6%95%B0/%E5%90%91%E9%87%8F%E7%A9%BA%E9%97%B4"
)

#let 线性表示 = optionLink("LinearCombination", [线性表示])

#let 线性相关 = optionLink("LinearlyRelated", [线性相关])

#let 线性无关 = optionLink("LinearlyIndependent", [线性无关], url: "https://zh.wikipedia.org/wiki/%E7%B9%BC%E6%89%BF%E6%95%B0%E5%AD%A6/%E7%BA%BF%E6%80%A7%E4%BB%A3%E6%95%B0/%E7%B9%BC%E6%89%BF%E7%8B%AC%E7%AB%8B")

#let 极大线性无关组 = optionLink("MaximallyLinearlyIndependentSet", [极大线性无关组])

#let 秩 = optionLink("Rank", [秩], url: "https://zh.wikipedia.org/wiki/%E6%A7%A3_(%E7%B9%BC%E6%89%BF%E4%BB%A3%E6%95%B0)")

#let 基 = optionLink("Basis", [基], url: "https://zh.wikipedia.org/wiki/%E7%B9%BC%E6%89%BF%E7%B9%BC%E7%AB%8B")

#let 自由张成 = (s : "", f : "") => optionLink(
  "FreeSpan",
  {
    if (s != "") {
      s
      if (f != "") [ 在 #f 上]
    }
    [张成的自由线性空间]
  },
)

#let GL = (V) => $
  #optionLink("GeneralLinearGroup", $op("GL")$, url: "https://zh.wikipedia.org/wiki/%E4%B8%80%E8%88%AC%E7%BA%BF%E6%80%A7%E7%BE%A4") (#V)
$

#let 代数 = optionLink(
  "Algebra",
  [代数]
)

#let IdM = optionLink(
  "IdentityMatrix",
  [$bold(1)$],
  url: "https://zh.wikipedia.org/wiki/%E5%96%AE%E4%BD%8D%E7%9F%A9%E9%99%A3"
)

#let LIso = (..arguments) => $
lr(
  optionLink(
    "LinearTransformation",
    bracket.l.stroked,
    url: "https://zh.wikipedia.org/wiki/%E7%9B%B8%E4%BC%BC%E7%9F%A9%E9%99%A3"
  )
  mat(..arguments, delim: #none)
  optionLink(
    "LinearTransformation",
    bracket.r.stroked,
    url: "https://zh.wikipedia.org/wiki/%E7%9B%B8%E4%BC%BC%E7%9F%A9%E9%99%A3"
  )
)$

#let 张成 = optionLink("Span", [张成], url: "https://zh.wikipedia.org/wiki/%E7%B9%BC%E6%89%BF%E6%A0%BC")

#let 直和 = optionLink("DirectSum", [直和], url: "https://zh.wikipedia.org/wiki/%E7%9B%B4%E6%8E%A5%E6%AD%A3%E5%92%8C")

#let 转译 = optionLink("Translate", [转译])

#let 陪集 = optionLink("Coset", [陪集], url: "https://zh.wikipedia.org/wiki/%E9%99%AA%E9%9B%86")

#let 商空间 = optionLink("QuotientSpace", [商空间], url: "https://zh.wikipedia.org/wiki/%E5%95%86%E7%A9%BA%E9%97%B4")

#let 线性子空间 = optionLink(
  "LinearSubspace",
  [线性子空间]
)

#let 不变子空间 = optionLink(
  "InvariantSubspace",
  [不变子空间]
)

#let Lquot = optionLink(
  "LinearQuotient",
  $\/$,
)

#let Lrestr = (f, s) => $#f#optionLink(
  "LinearRestriction",
  $|$,
)_#s$