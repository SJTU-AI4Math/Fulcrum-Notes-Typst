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

// ============================================================
// §2 常系数非齐次线性微分方程组 — cross-ref optionLink 包装
// ============================================================

#let 常系数非齐次线性方程组 = optionLink("NonhomogeneousLinearSystem", [常系数非齐次线性微分方程组])

#let 仿射解空间定理 = optionLink("NonhomogeneousSolutionAffineSpace", [非齐次方程组的解集是仿射空间])

#let 基本解矩阵 = optionLink("FundamentalSolutionMatrix", [基本解矩阵])

#let 基本解矩阵的关键性质 = optionLink("FundamentalSolutionMatrixProperties", [基本解矩阵的关键性质])

#let 齐次通解 = optionLink("HomogeneousGeneralSolutionViaPhi", [常系数齐次线性方程组的通解参数化])

#let 变易系数法 = optionLink("VariationOfParameters", [变易系数法])

#let 变易系数法产生特解 = optionLink("VOPGivesSolution", [变易系数法产生非齐次方程组的特解])

#let 非齐次通解 = optionLink("NonhomogeneousGeneralSolutionViaVOP", [常系数非齐次线性方程组的通解参数化])

#let 变易系数法是特解 = optionLink("VOPGivesSolution", [变易系数法是特解])

#let FundamentalSolutionMatrixInvertible = optionLink("FundamentalSolutionMatrixInvertible", [基本解矩阵处处可逆])

#let FundamentalSolutionMatrixODE = optionLink("FundamentalSolutionMatrixODE", [基本解矩阵满足矩阵 ODE])

#let Duhamel公式 = optionLink("DuhamelFormula", [Duhamel 公式])

// ============================================================
// §3 周期系数线性微分方程组 — cross-ref optionLink 包装
// ============================================================

#let 周期系数线性方程组 = optionLink("PeriodicLinearSystem", [周期系数线性微分方程组])

#let Floquet定理 = optionLink("FloquetTheorem", [Floquet 定理])

#let monodromy算子 = optionLink("MonodromyOperator", [monodromy 算子])

#let monodromy矩阵 = optionLink("MonodromyMatrix", [monodromy 矩阵])

#let Floquet乘子 = optionLink("FloquetMultiplier", [Floquet 乘子])

#let Floquet指数 = optionLink("FloquetExponent", [Floquet 指数])

#let 周期解稳定性 = optionLink("PeriodicSolutionStability", [周期系数线性方程组解的渐近行为])

// monodromy 算子符号 (const, 通常调用 #Mono _(A) 或 #Mono _(Phi))
#let Mono = optionLink("MonodromyOperator", $cal(M)$)

// —— 矩阵指数 ——

#let 矩阵指数 = optionLink("MatrixExponential", [矩阵指数])

#let 矩阵指数良定 = optionLink("MatrixExponentialWelldefined", [矩阵指数良定])

#let MatrixExponentialAtZero = optionLink("MatrixExponentialAtZero", [矩阵指数初值归一])

#let MatrixExponentialODE = optionLink("MatrixExponentialODE", [矩阵指数满足矩阵 ODE])

#let MatrixExponentialGroupProperty = optionLink("MatrixExponentialGroupProperty", [矩阵指数的群性质])

#let MatrixExponentialInvertible = optionLink("MatrixExponentialInvertible", [矩阵指数处处可逆])

#let 矩阵指数等于形式幂级数 = optionLink("MatrixExponentialEqualsPowerSeries", [矩阵指数等于形式幂级数])

// 矩阵指数符号 (const, 调用处显式带括号 / 参数)
#let expM = optionLink("MatrixExponential", $exp$)

// 基本解矩阵符号: Phi 是带 optionLink 的常量, 下标在调用处显式写 (Phi_phi)
#let Phi基 = optionLink("FundamentalSolutionMatrix", $Phi$)

// 变易系数法符号: VOP(Phi, b, t_0)
#let VOP = optionLink("VariationOfParameters", $op("VOP")$)
