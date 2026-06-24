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

// ============================================================
// 特征值理论 / Jordan 标准型 (术语化 only, entry 待 LA 章补)
// ============================================================

// —— 特征值 / 特征向量族 ——

#let 特征值 = optionLink("Eigenvalue", [特征值], url: "https://zh.wikipedia.org/wiki/%E7%89%B9%E5%BE%B5%E5%80%BC")

#let 特征向量 = optionLink("Eigenvector", [特征向量], url: "https://zh.wikipedia.org/wiki/%E7%89%B9%E5%BE%B5%E5%90%91%E9%87%8F")

#let 广义特征向量 = optionLink("GeneralizedEigenvector", [广义特征向量], url: "https://en.wikipedia.org/wiki/Generalized_eigenvector")

#let 特征子空间 = optionLink("Eigenspace", [特征子空间])

#let 广义特征子空间 = optionLink("GeneralizedEigenspace", [广义特征子空间])

#let 特征多项式 = optionLink("CharacteristicPolynomial", [特征多项式], url: "https://zh.wikipedia.org/wiki/%E7%89%B9%E5%BE%81%E5%A4%9A%E9%A1%B9%E5%BC%8F")

#let 极小多项式 = optionLink("MinimalPolynomial", [极小多项式], url: "https://zh.wikipedia.org/wiki/%E6%9C%80%E5%B0%8F%E5%A4%9A%E9%A1%B9%E5%BC%8F")

#let 代数重数 = optionLink("AlgebraicMultiplicity", [代数重数])

#let 几何重数 = optionLink("GeometricMultiplicity", [几何重数])

// —— Jordan 标准型 ——

#let Jordan标准型 = optionLink("JordanCanonicalForm", [Jordan 标准型], url: "https://zh.wikipedia.org/wiki/%E7%BA%A6%E5%B0%94%E5%BD%93%E6%A0%87%E5%87%86%E5%9E%8B")

#let Jordan块 = optionLink("JordanBlock", [Jordan 块])

#let Jordan链 = optionLink("JordanChain", [Jordan 链])

#let Jordan基 = optionLink("JordanBasis", [Jordan 基])

// Jordan 块符号: $J_m(λ)$ 表 m 阶 Jordan 块对应特征值 λ
#let JBlock = (m, lambdas) => $#optionLink("JordanBlock", $J$)_(#m)(#lambdas)$

// —— 谱 / 算子函数计算的基本对象 ——

#let 谱 = optionLink("Spectrum", [谱], url: "https://zh.wikipedia.org/wiki/%E8%B0%B1_(%E6%95%B0%E5%AD%A6)")

#let Spec = optionLink("Spectrum", $op("Spec")$)

// 幂零部分 / 半单部分 (Jordan-Chevalley 分解)
#let 幂零 = optionLink("Nilpotent", [幂零])

#let 半单 = optionLink("Semisimple", [半单])

#let JordanChevalley = optionLink("JordanChevalleyDecomposition", [Jordan-Chevalley 分解])