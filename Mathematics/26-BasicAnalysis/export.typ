#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let BasicAnalysisStyle = body => (
  body
)

#let 实函数连续 = optionLink(
  "RealFunctionContinuous",
  [连续],
)

#let dv = (f, x) => [
  #optionLink("Derivative", $frac(dif #f, dif #x)$)
]

#let pdv = (f, x) => [
  #optionLink("PartialDerivative", $frac(partial #f, partial #x)$)
]
