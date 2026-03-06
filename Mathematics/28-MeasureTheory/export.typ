#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let MeasureTheoryStyle = body => {
  body
}

#let 集合半环 = optionLink(
  "SetSemiRing",
  [集合半环],
)

#let Sigma代数 = optionLink("SigmaAlgebra", [$sigma$-代数])

#let Borel集族 = optionLink(
  "BorelSets",
  [Borel 集族],
)

#let Borel = (type) => $#optionLink("BorelSets", $scr(B)$) (type)$

#let 测度空间 = optionLink("MeasureSpace", [测度空间])

#let measure = (symbol) => optionLink("MeasureSpace", symbol)

#let Borel测度 = optionLink(
  "BorelMeasure",
  [Borel 测度],
)

#let 集合Lebesgue可测 = optionLink("LebesgueMeasurableSet", [Lebesgue 可测])