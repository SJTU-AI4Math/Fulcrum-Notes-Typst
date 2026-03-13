#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let 线性空间 = optionLink(
  "LinearSpace",
  [线性空间]
)

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