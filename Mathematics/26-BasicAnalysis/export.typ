#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let BasicAnalysisStyle = body => (
  body
)

#let 实函数连续 = optionLink(
  "RealFunctionContinuous",
  [连续],
)

#let 实函数一致连续 = optionLink(
  "RealFunctionUniformlyContinuous",
  [一致连续],
)

#let dv = (f, x) => [
  #optionLink("Derivative", $frac(dif #f, dif #x)$)
]

#let pdv = (f, x) => [
  #optionLink("PartialDerivative", $frac(partial #f, partial #x)$)
]

// ============================================================
// 卷积 (entry 在 main.typ 一级章 "卷积" 内)
// ============================================================

#let 卷积 = optionLink("Convolution", [卷积], url: "https://zh.wikipedia.org/wiki/%E5%8D%B7%E7%A7%AF")

// 卷积运算符: f * g (中圆点风格), 用 conv 作 ASCII 名避免和乘法 * 冲突
// 调用: $f conv g$ 或 $#KK conv f$ 等
#let conv = optionLink("Convolution", $ast.op$)
