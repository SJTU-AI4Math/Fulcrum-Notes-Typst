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

#let Abel群 = optionLink(
  "AbelianGroup",
  [Abel 群],
  url: "https://zh.wikipedia.org/wiki/%E9%98%BF%E8%B4%9D%E5%B0%94%E7%BE%A4"
)

#let 单位元 = optionLink(
  "Identity",
  [单位元]
)

#let 逆元 = optionLink(
  "Inverse",
  [逆元]
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

#let 群单同态 = optionLink(
  "GroupMonomorphism",
  [群单同态]
)

#let 群满同态 = optionLink(
  "GroupEpimorphism",
  [群满同态]
)

#let 群同构 = optionLink(
  "GroupIsomorphism",
  [群同构]
)

#let 群同态的核 = optionLink("GroupHomKernel", [核])
#let 群同态的像 = optionLink("GroupHomImage", [像])
#let GKer = (f) => $#optionLink("GroupHomKernel", $op("Ker")$) (#f)$
#let GIm = (f) => $#optionLink("GroupHomImage", $op("Im")$) (#f)$

#let 子群 = optionLink(
  "Subgroup",
  [子群]
)

#let 真子群 = optionLink(
  "ProperSubgroup",
  [真子群]
)

#let SubG = $#optionLink("Subgroup", $<=$)$
#let PSubG = $#optionLink("ProperSubgroup", $<$)$

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

#let 群自同态 = optionLink("GroupEndomorphism", [群自同态])
#let 群自同构 = optionLink("GroupAutomorphism", [群自同构])
#let GEnd = (G) => $#optionLink("GroupEndomorphism", $op("End")$) (#G)$
#let GAut = (G) => $#optionLink("GroupAutomorphism", $op("Aut")$) (#G)$

#let 域 = optionLink(
  "Field",
  [域]
)

// ============================================================
// 置换群 / 群作用 / 群范畴 — 术语注册
// ============================================================

// 置换群
#let 置换 = optionLink("Permutation", [置换], url: "https://zh.wikipedia.org/wiki/%E7%BD%AE%E6%8D%A2")
#let 对称群 = optionLink("SymmetricGroup", [对称群], url: "https://zh.wikipedia.org/wiki/%E5%AF%B9%E7%A7%B0%E7%BE%A4_(n%E6%AC%A1%E5%AF%B9%E7%A7%B0%E7%BE%A4)")
#let 轮换 = optionLink("Cycle", [轮换], url: "https://zh.wikipedia.org/wiki/%E8%BD%AE%E6%8D%A2_(%E7%BE%A4%E8%AE%BA)")
#let 不交轮换 = optionLink("DisjointCycles", [不交轮换])
#let 对换 = optionLink("Transposition", [对换], url: "https://zh.wikipedia.org/wiki/%E5%AF%B9%E6%8D%A2")
#let 奇置换 = optionLink("OddPermutation", [奇置换])
#let 偶置换 = optionLink("EvenPermutation", [偶置换])
#let 交错群 = optionLink("AlternatingGroup", [交错群], url: "https://zh.wikipedia.org/wiki/%E4%BA%A4%E9%94%99%E7%BE%A4")

// 群作用
#let 群作用 = optionLink("GroupAction", [群作用], url: "https://zh.wikipedia.org/wiki/%E7%BE%A4%E4%BD%9C%E7%94%A8")
#let 轨道 = optionLink("Orbit", [轨道])
#let 稳定子群 = optionLink("Stabilizer", [稳定子群])
#let 稳定子 = optionLink("Stabilizer", [稳定子])
#let 不动点集 = optionLink("FixedPointSet", [不动点集])
#let 共轭作用 = optionLink("ConjugationAction", [共轭作用])
#let 共轭类 = optionLink("ConjugacyClass", [共轭类])
#let 中心化子 = optionLink("Centralizer", [中心化子])
#let 中心 = optionLink("Center", [中心])

// notation: Stab(x), Orb(x), C_G(x), Z(G)
#let Stab = (x) => $#optionLink("Stabilizer", $op("Stab")$) (#x)$
#let Orb = (x) => $#optionLink("Orbit", $op("Orb")$) (#x)$
#let Centralizer = (x) => $#optionLink("Centralizer", $C$);_G (#x)$
#let Center = (G) => $#optionLink("Center", $Z$);(#G)$

// 群范畴
#let 群范畴 = optionLink("CategoryOfGroups", [群范畴])
#let 群直积 = optionLink("DirectProductOfGroups", [群直积], url: "https://zh.wikipedia.org/wiki/%E7%9B%B4%E7%A7%AF")
#let 群余积 = optionLink("CoproductOfGroups", [群余积])
#let 自由积 = optionLink("FreeProduct", [自由积], url: "https://zh.wikipedia.org/wiki/%E8%87%AA%E7%94%B1%E7%A7%AF")

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
#let UnitGroupOf = (R) => $#optionLink("UnitGroup", $#R^times$)$
#let 零因子 = optionLink("ZeroDivisor", [零因子])
#let 左零因子 = optionLink("LeftZeroDivisor", [左零因子])
#let 右零因子 = optionLink("RightZeroDivisor", [右零因子])
#let 幂零元 = optionLink("Nilpotent", [幂零元])
#let 幂等元 = optionLink("Idempotent", [幂等元])

// 整数数乘
#let 整数数乘 = optionLink("RingIntegerScalar", [整数数乘])

// 环的特征
#let 环的特征 = optionLink("RingCharacteristic", [环的特征])

// notation: char(R)
#let char = (R) => $#optionLink("RingCharacteristic", $op("char")$) (#R)$

// 子结构与理想
#let 子环 = optionLink("Subring", [子环])
#let 左理想 = optionLink("LeftIdeal", [左理想])
#let 右理想 = optionLink("RightIdeal", [右理想])
#let 理想 = optionLink("TwoSidedIdeal", [理想])
#let 真理想 = optionLink("ProperIdeal", [真理想])
#let 由集合生成的理想 = optionLink("IdealGenerated", [由集合生成的理想])
#let IdealGen = (S) => $#optionLink("IdealGenerated", $chevron.l$) #S #optionLink("IdealGenerated", $chevron.r$)$
#let 主理想 = optionLink("PrincipalIdeal", [主理想])
#let 素理想 = optionLink("PrimeIdeal", [素理想])
#let 极大理想 = optionLink("MaximalIdeal", [极大理想])
#let 单环 = optionLink("SimpleRing", [单环])

// 理想运算
#let 理想的和 = optionLink("IdealSum", [理想的和])
#let 理想的积 = optionLink("IdealProduct", [理想的积])
#let 理想的交 = optionLink("IdealIntersection", [理想的交])

// 商环
#let 商环 = optionLink("QuotientRing", [商环])

// 直和与中国剩余定理
#let 环的直积 = optionLink("RingDirectProduct", [环的直积])
#let 理想互素 = optionLink("CoprimeIdeals", [理想互素])
#let 中国剩余定理 = optionLink("ChineseRemainderTheorem", [中国剩余定理])

// 环同态
#let 环同态 = optionLink("RingHomomorphism", [环同态])
#let 幺环同态 = optionLink("UnitalRingHomomorphism", [幺环同态])
#let 环同态的核 = optionLink("RingHomKernel", [核])
#let 环同态的像 = optionLink("RingHomImage", [像])
#let 环同构 = optionLink("RingIsomorphism", [环同构])
#let 环单同态 = optionLink("RingMonomorphism", [环单同态])
#let 环满同态 = optionLink("RingEpimorphism", [环满同态])
#let 环自同态 = optionLink("RingEndomorphism", [环自同态])
#let 环自同构 = optionLink("RingAutomorphism", [环自同构])
#let RHom = (R, S) => $#optionLink(
  "RingHomomorphism",
  $op("Hom")$
) (#R, #S)$
#let URHom = (R, S) => $#optionLink(
  "UnitalRingHomomorphism",
  $op("Hom")_1$
) (#R, #S)$
#let RMono = optionLink("RingMonomorphism", [$arrow.hook$])
#let REpi = optionLink("RingEpimorphism", [$arrow.twohead$])
#let RIso = optionLink("RingIsomorphism", [$tilde.equiv$])
#let REnd = (R) => $#optionLink("RingEndomorphism", $op("End")$) (#R)$
#let RAut = (R) => $#optionLink("RingAutomorphism", $op("Aut")$) (#R)$
#let RKer = (f) => $#optionLink("RingHomKernel", $op("Ker")$) (#f)$
#let RIm = (f) => $#optionLink("RingHomImage", $op("Im")$) (#f)$

// 多项式环
#let 多项式环 = optionLink("PolynomialRing", [多项式环])
#let 多项式的次数 = optionLink("PolynomialDegree", [多项式的次数])
#let 首一多项式 = optionLink("MonicPolynomial", [首一多项式])

// 整除与素元
#let 整除 = optionLink("Divides", [整除])
#let 素 = optionLink("PrimeElement", [素])
#let 不可约 = optionLink("IrreducibleElement", [不可约])
#let 相伴 = optionLink("Associate", [相伴])

// 二次整环 / Gauss 整环 / 范数
#let 二次整环 = optionLink("QuadraticIntegerRing", [二次整环])
#let Gauss整环 = optionLink("GaussianIntegers", [Gauss 整环])
#let Eisenstein整环 = optionLink("EisensteinIntegers", [Eisenstein 整环])
#let 范数 = optionLink("RingNorm", [范数])
#let 乘性范数 = optionLink("MultiplicativeNorm", [乘性范数])
#let GaussN = (z) => $#optionLink("RingNorm", $N$) (#z)$

// 分式域
#let 分式域 = optionLink("FieldOfFractions", [分式域])
#let Frac = (R) => $#optionLink(
  "FieldOfFractions",
  $op("Frac")$
) (#R)$

// 环范畴
#let 环范畴 = optionLink("CategoryOfRings", [环范畴])
#let 环直积 = optionLink("RingDirectProduct", [环直积])
