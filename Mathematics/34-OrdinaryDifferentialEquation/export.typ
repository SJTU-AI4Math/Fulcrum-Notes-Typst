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

#let 解空间结构定理 = optionLink("ConstantCoefficientHomogeneousSolutionSpace", [常系数齐次线性方程组的解空间结构])

#let 常系数基本解 = optionLink("FundamentalSolutionConstantCoefficient", [基本解])

// —— 构造性函数 (CNL 铁律 B: 用具体对象代替"由 X 产生") ——

// JordanChainSolutions(λ, (v_0, ..., v_(m-1)))(t) = 单条 Jordan 链产生的解族 (函数 R → C^n 的元组)
#let JCS = optionLink("JordanChainSolutions", $op("JCS")$)

// JordanBasisSolutions((链族))(t) = 全体 Jordan 基产生的基本解组
#let JBS = optionLink("JordanBasisSolutions", $op("JBS")$)

#let Jordan链产生的解族 = optionLink("JordanChainSolutions", [Jordan 链产生的解族])

#let Jordan基产生的解组 = optionLink("JordanBasisSolutions", [Jordan 基产生的解组])

#let Jordan链产生的解族都是解 = optionLink("JordanChainSolutionsSolve", [Jordan 链产生的解族都是解])

#let Jordan基产生的解组是基本解 = optionLink("JordanBasisSolutionsAreFundamental", [Jordan 基产生的解组是基本解])
