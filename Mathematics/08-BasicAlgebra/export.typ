#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let AlgebraStyle = body => {
  show math.sum : math.limits(optionLink("Algebra.sum", $sum$, url: "https://zh.wikipedia.org/wiki/%E6%B1%82%E5%92%8C%E7%AC%A6%E5%8F%B7"))
  body
}

#let SymmGroup = (n) => $#optionLink(
  "SymmetryGroup",
  [$S$],
  url: "https://zh.wikipedia.org/wiki/%E5%AF%B9%E7%A7%B0%E7%BE%A4_(n%E6%AC%A1%E5%AF%B9%E7%A7%B0%E7%BE%A4)"
)_#n$

#let Sym = (S) => $#optionLink(
  "SymmetryGroup",
  [$op("Sym")$],
  url: "https://zh.wikipedia.org/wiki/%E5%AF%B9%E7%A7%B0%E7%BE%A4_(n%E6%AC%A1%E5%AF%B9%E7%A7%B0%E7%BE%A4)"
);(S)$

#let 半群 = optionLink(
  "Semigroup",
  [半群]
)

#let 幂 = optionLink(
  "NatPower",
  [自然数幂]
)

#let 幺半群 = optionLink(
  "Monoid",
  [幺半群]
)

#let 群 = optionLink(
  "Group",
  [群]
)

#let GHom = (G, H) => $#optionLink(
  "GroupHomomorphism",
  $op("Hom")$,
  url: "https://zh.wikipedia.org/wiki/%E7%BE%A4%E5%90%8C%E6%85%8B",
) (#G, #H)$

#let 群同态 = optionLink(
  "GroupHomomorphism",
  [群同态],
  url: "https://zh.wikipedia.org/wiki/%E7%BE%A4%E5%90%8C%E6%85%8B"
)

#let GMono = optionLink(
  "GroupMonomorphism",
  [$arrow.hook$]
)

#let GEpi = optionLink(
  "GroupEpimorphism",
  [$arrow.twohead$]
)

#let GIso = optionLink(
  "GroupIsomorphism",
  [$tilde.equiv$]
)

#let 域 = optionLink(
  "Field",
  [域]
)

// ============================================================
// 环论 — 术语注册 (与 main.typ 中环论 entry 的 uuid 一一对应)
// ============================================================

// 环类
#let 环 = optionLink("Ring", [环])
#let 交换环 = optionLink("CommutativeRing", [交换环])
#let 幺环 = optionLink("UnitalRing", [幺环])
#let 交换幺环 = optionLink("CommutativeUnitalRing", [交换幺环])
#let 零环 = optionLink("ZeroRing", [零环])
#let 整环 = optionLink("IntegralDomain", [整环])
#let 除环 = optionLink("DivisionRing", [除环])
#let 体 = optionLink("DivisionRing", [体])
#let 欧几里得整环 = optionLink("EuclideanDomain", [欧几里得整环])
#let 主理想整环 = optionLink("PrincipalIdealDomain", [主理想整环])
#let 唯一分解整环 = optionLink("UniqueFactorizationDomain", [唯一分解整环])

// 环的元素类
#let 单位 = optionLink("Unit", [单位])
#let 可逆元 = optionLink("Unit", [可逆元])
#let 单位群 = optionLink("UnitGroup", [单位群])
#let 零因子 = optionLink("ZeroDivisor", [零因子])
#let 幂零元 = optionLink("Nilpotent", [幂零元])
#let 幂等元 = optionLink("Idempotent", [幂等元])

// 环的特征
#let 环的特征 = optionLink("RingCharacteristic", [环的特征])

// 子结构与理想
#let 子环 = optionLink("Subring", [子环])
#let 左理想 = optionLink("LeftIdeal", [左理想])
#let 右理想 = optionLink("RightIdeal", [右理想])
#let 双边理想 = optionLink("TwoSidedIdeal", [双边理想])
#let 理想 = optionLink("TwoSidedIdeal", [理想])
#let 真理想 = optionLink("ProperIdeal", [真理想])
#let 由集合生成的理想 = optionLink("IdealGenerated", [由集合生成的理想])
#let 主理想 = optionLink("PrincipalIdeal", [主理想])
#let 素理想 = optionLink("PrimeIdeal", [素理想])
#let 极大理想 = optionLink("MaximalIdeal", [极大理想])

// 理想运算
#let 理想的和 = optionLink("IdealSum", [理想的和])
#let 理想的积 = optionLink("IdealProduct", [理想的积])
#let 理想的交 = optionLink("IdealIntersection", [理想的交])

// 商环
#let 商环 = optionLink("QuotientRing", [商环])

// 环同态
#let 环同态 = optionLink("RingHomomorphism", [环同态])
#let 环同态的核 = optionLink("RingHomKernel", [环同态的核])
#let 环同态的像 = optionLink("RingHomImage", [环同态的像])
#let 环同构 = optionLink("RingIsomorphism", [环同构])
#let RHom = (R, S) => $#optionLink(
  "RingHomomorphism",
  $op("Hom")$
) (#R, #S)$

// 多项式环
#let 多项式环 = optionLink("PolynomialRing", [多项式环])
#let 多项式的次数 = optionLink("PolynomialDegree", [多项式的次数])
#let 首一多项式 = optionLink("MonicPolynomial", [首一多项式])
#let 不可约多项式 = optionLink("IrreduciblePolynomial", [不可约多项式])

// 整除与素元
#let 整除 = optionLink("Divides", [整除])
#let 素元 = optionLink("PrimeElement", [素元])
#let 不可约元 = optionLink("IrreducibleElement", [不可约元])

// 分式域
#let 分式域 = optionLink("FieldOfFractions", [分式域])
#let Frac = (R) => $#optionLink(
  "FieldOfFractions",
  $op("Frac")$
) (#R)$

// 环范畴
#let 环范畴 = optionLink("CategoryOfRings", [环范畴])
#let 环直积 = optionLink("RingDirectProduct", [环直积])
