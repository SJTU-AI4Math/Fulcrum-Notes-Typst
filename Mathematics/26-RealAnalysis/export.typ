// Mathematics/26-RealAnalysis/export.typ
//
// 实分析 (Lebesgue 路线 / Royden 4th ed Part I) 术语导出
// 范围: Lebesgue 可测函数 / 收敛 / 积分 / 微分 / 乘积测度 / L^p

#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let RealAnalysisStyle = body => body

// ============================================================
// §1 Lebesgue 可测函数
// ============================================================

#let 函数Lebesgue可测 = optionLink("LebesgueMeasurableFunction", [Lebesgue 可测])
#let 函数Lebesgue不可测 = optionLink("LebesgueMeasurableFunction", [Lebesgue 不可测])
#let 简单 = optionLink("SimpleFunction", [简单])
#let 阶梯 = optionLink("StepFunction", [阶梯])
#let 几乎处处相等 = optionLink("AlmostEverywhereEqual", [几乎处处相等])
#let 依测度等价 = optionLink("LebesgueMeasureFunctionEquiv", [依测度等价])

// ============================================================
// §2 收敛 (a.e. / 几乎一致 / 依测度)
// ============================================================

#let 几乎处处收敛 = optionLink("AlmostEverywhereConvergence", [几乎处处收敛])
#let 几乎一致收敛 = optionLink("AlmostUniformConvergence", [几乎一致收敛])
#let 依测度收敛 = optionLink("ConvergenceInMeasure", [依测度收敛])

// 收敛符号化 (上下标堆叠在箭头正上 / 正下方)
//   逐点收敛       f_n ->_D f
//   a.e. 逐点收敛   f_n ->^(a.e.)_D f   (= 几乎处处收敛)
//   一致收敛       f_n ⇒_D f
//   a.e. 一致收敛   f_n ⇒^(a.e.)_D f    (= 几乎一致收敛)
//   依测度收敛     f_n ->^μ_D f
#let 逐点收敛符 = (D) => $limits(stretch(arrow.r))_(#D)$
#let ae逐点收敛符 = (D) => $limits(stretch(#optionLink("AlmostEverywhereConvergence", $arrow.r$)))^("a.e.")_(#D)$
#let 一致收敛符 = (D) => $limits(stretch(arrow.r.double))_(#D)$
#let ae一致收敛符 = (D) => $limits(stretch(#optionLink("AlmostUniformConvergence", $arrows.rr$)))^("a.e.")_(#D)$
#let 依测度收敛符 = (D) => $limits(stretch(#optionLink("ConvergenceInMeasure", $arrow.r$)))^(mu)_(#D)$

// ============================================================
// §3 Lebesgue 积分
// ============================================================

#let 简单函数积分 = optionLink("SimpleFunctionIntegral", [简单函数积分])
#let 非负可测函数积分 = optionLink("NonnegativeMeasurableIntegral", [非负可测函数积分])
#let Lebesgue可积 = optionLink("LebesgueIntegrable", [Lebesgue 可积])
#let Lebesgue积分 = optionLink("LebesgueIntegral", [Lebesgue 积分])
#let Lebesgue测度 = optionLink("LebesgueMeasure", [Lebesgue 测度])
#let 函数有界 = optionLink("BoundedFunction", [有界])
#let 一致可积 = optionLink("UniformlyIntegrable", [一致可积])

#let 积分 = (f) => $#optionLink("LebesgueIntegral", $integral$) #f$
#let 积分于 = (f, E) => $#optionLink("LebesgueIntegral", $integral$)_(#E) #f$

// ============================================================
// §4 微分与不定积分
// ============================================================

#let Vitali覆盖 = optionLink("VitaliCover", [Vitali 覆盖])
#let 有界变差 = optionLink("BoundedVariation", [有界变差])
#let 全变差 = optionLink("TotalVariation", [全变差])
#let 可测集上全变差 = optionLink("TotalVariationOnMeasurableSet", [全变差])
#let V_集 = (E) => $#optionLink("TotalVariationOnMeasurableSet", $V$)_(#E)$
#let 绝对连续 = optionLink("AbsolutelyContinuous", [绝对连续])
#let 不定积分 = optionLink("IndefiniteIntegral", [不定积分])
#let Lebesgue点 = optionLink("LebesguePoint", [Lebesgue 点])

#let 上导数 = (f) => $#optionLink("UpperDerivative", $overline(D)$) #f$
#let 下导数 = (f) => $#optionLink("LowerDerivative", $underline(D)$) #f$

// ============================================================
// §5 乘积测度与 Fubini
// ============================================================

#let 乘积Sigma代数 = optionLink("ProductSigmaAlgebra", [乘积 $sigma$-代数])
#let 乘积测度 = optionLink("ProductMeasure", [乘积测度])
#let 截面 = optionLink("CrossSection", [截面])

// ============================================================
// §6 L^p 空间
// ============================================================

#let Lp空间 = (p) => $#optionLink("LpSpace", $L^#p$)$
#let Lp范数 = (p, f) => $#optionLink("LpNorm", $norm(#f)_#p$)$
#let 本性有界 = optionLink("EssentiallyBounded", [本性有界])
#let 本性上确界 = optionLink("EssentialSupremum", [本性上确界])
#let Hölder不等式 = optionLink("HoelderInequality", [Hölder 不等式])
#let Minkowski不等式 = optionLink("MinkowskiInequality", [Minkowski 不等式])
