#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let SepODE = (
  optionLink(
    "SeparableODE",
    [可分离变量的常微分方程],
  )
)

#let FLODE = (
  optionLink(
    "FirstorderLinearODE",
    [一阶线性微分方程],
  )
)

#let BernoulliODE = (
  optionLink(
    "BernoulliODE",
    [Bernoulli 微分方程],
  )
)

// ============================================================
// 线性微分方程组章节 — 章内 entry cross-ref optionLink 包装
// ============================================================

#let 一阶向量ODE = optionLink("FirstorderODE", [一阶向量 ODE])

#let 自治ODE = optionLink("AutonomousODE", [自治 ODE])

#let 常系数齐次线性方程组 = optionLink("ConstantCoefficientHomogeneousLinearSystem", [常系数齐次线性微分方程组])

#let 解空间结构定理 = optionLink("ConstantCoefficientHomogeneousSolutionSpace", [解空间是 $n$ 维线性空间])

#let 常系数基本解 = optionLink("FundamentalSolutionConstantCoefficient", [基本解])

#let Jordan链产生基本解 = optionLink("JordanChainFundamentalSolutions", [Jordan 链产生基本解])

#let Jordan链族给出基本解 = optionLink("JordanChainsYieldFundamentalSolutions", [Jordan 链族给出基本解])
