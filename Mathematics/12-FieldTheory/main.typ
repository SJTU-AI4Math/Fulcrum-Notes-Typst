/* main */
#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "./export.typ": *

/* 依赖：基础代数（环、域、多项式、单环、中国剩余定理） */
#import "../03-Logic/export.typ": *
#import "../03-SetTheory/export.typ": *
#import "../03-TypeTheory/export.typ": *
#import "../08-BasicAlgebra/export.typ": *

#show: FulcrumCN

#align(center)[
  #block(text(weight: "bold", size: 2em)[域论])
]

#align(center)[
  #block(text(weight: "bold", size: 1em)[Field Theory])
]

#outline(title: "目录", indent: 2em)

#pagebreak()

#注条目("", "", uuid: "FieldTheoryConvention")[
  本章假定底域 $F$ 为#域（即交换#除环；08-BasicAlgebra 中定义），扩域 $E$ 同样为#域。除非特别说明，所有多项式系数取自给定的底域。
]


= 域扩张与代数 / 超越元

== 域扩张

#约定[
  - $F$ 是#域
  - $E$ 是#域，且 $F$ 是 $E$ 的#子环，$1_E = 1_F$
]

#定义条目("域扩张", "Field Extension", uuid: "FieldExtension")[
  #定义子句(
    主体: [$E$ 是 $F$ 的#域扩张],
    isPredicate: true,
    内容: [$F$ 是 $E$ 的#子环;且 $1_E = 1_F$；记 $F subset.eq E$ 为#域扩张，记号 $E slash F$],
  )
  // TODO: 补 $E$ 作为 $F$-向量空间的视角；补例 $bb(C) slash bb(R)$, $bb(R) slash bb(Q)$。
]

#定义条目("扩张次数", "Degree of Extension", uuid: "ExtensionDegree")[
  #定义子句(
    条件: ([~$E slash F$ 是#域扩张]),
    主体: [扩张 $E slash F$ 的#扩张次数 $[E : F]$],
    内容: [$E$ 作为 $F$-向量空间的维数],
    记号: $[E : F]$,
  )
  // TODO: 补 $[bb(C) : bb(R)] = 2$, $[bb(R) : bb(Q)] = infinity$ 等例。
]

#定义条目("有限扩张", "Finite Extension", uuid: "FiniteExtension")[
  #定义子句(
    主体: [$E slash F$ 是#有限扩张],
    isPredicate: true,
    内容: [$[E : F] < infinity$],
  )
]

#定理条目("塔公式", "Tower Formula", uuid: "FieldExtensionTowerFormula")[
  #定理子句(
    条件: ([~$F subset.eq K subset.eq E$ 是#域扩张;的塔]),
    结论: [$[E : F] = [E : K] dot [K : F]$；特别地，$E slash F$ 是#有限扩张#iff;$E slash K$ 与 $K slash F$ 都是#有限扩张],
  )
  // TODO: 证明骨架（取 $K slash F$ 与 $E slash K$ 的基，作 tensor）。
]

== 代数元与超越元

#约定[
  - $E slash F$ 是#域扩张
  - $alpha : E$
]

#定义条目("代数元", "Algebraic Element", uuid: "AlgebraicElement")[
  #定义子句(
    主体: [$alpha$ 是 $F$ 上的#代数元],
    isPredicate: true,
    内容: [$exists f : F[x], f != 0 and f(alpha) = 0$],
  )
]

#定义条目("超越元", "Transcendental Element", uuid: "TranscendentalElement")[
  #定义子句(
    主体: [$alpha$ 是 $F$ 上的#超越元],
    isPredicate: true,
    内容: [$alpha$ 不是 $F$ 上的#代数元],
  )
  // TODO: 经典例 $pi, e$ 是 $bb(Q)$ 上的超越元（Lindemann / Hermite）。
]

#定义条目("极小多项式", "Minimal Polynomial", uuid: "MinimalPolynomial")[
  #定义子句(
    条件: ([~$alpha$ 是 $F$ 上的#代数元]),
    主体: [$alpha$ 在 $F$ 上的#极小多项式],
    内容: [次数最小的#首一多项式 $m_alpha (x) : F[x]$ 使得 $m_alpha (alpha) = 0$],
    记号: $m_alpha (x)$,
  )
]

#性质条目("极小多项式不可约", "")[
  #定理子句(
    条件: ([~$alpha$ 是 $F$ 上的#代数元], [$m_alpha$ 是 $alpha$ 的#极小多项式]),
    结论: [$m_alpha$ 在 $F[x]$ 中#不可约;且 $forall f : F[x], f(alpha) = 0 ==> m_alpha divides f$],
  )
  // TODO: 证明（极小多项式生成 $ker(F[x] -> E, x |-> alpha)$ 这个主理想）。
]

== 单代数扩张

#定义条目("单代数扩张", "Simple Algebraic Extension", uuid: "SimpleAlgebraicExtension")[
  #定义子句(
    条件: ([~$E slash F$ 是#域扩张], [$alpha : E$ 是 $F$ 上的#代数元]),
    主体: [$F$ 添加 $alpha$ 得到的#单代数扩张 $F(alpha)$],
    内容: [$E$ 中包含 $F$ 和 $alpha$ 的最小子域],
    记号: $F(alpha)$,
  )
]

#定理条目("单代数扩张同构于商环", "Simple Algebraic Extension as Quotient", uuid: "SimpleAlgExtAsQuotient")[
  #定理子句(
    条件: ([~$alpha$ 是 $F$ 上的#代数元], [$m_alpha$ 是 $alpha$ 的#极小多项式]),
    结论: [$F(alpha) tilde.equiv F[x] slash (m_alpha (x))$ 作为 $F$-代数；且 $[F(alpha) : F] = deg(m_alpha)$],
  )
  // TODO: 证明（用环第一同构定理）。
]


= 分裂域与代数闭包

== 分裂域

#定义条目("分裂域", "Splitting Field", uuid: "SplittingField")[
  #定义子句(
    条件: ([~$f : F[x]$, $f != 0$]),
    主体: [$f$ 在 $F$ 上的#分裂域],
    内容: [$f$ 在其上分解为线性因子乘积的最小#域扩张 $E$],
  )
  // TODO: 唯一性（同构意义下）。
]

#定理条目("分裂域存在唯一", "Existence and Uniqueness of Splitting Field", uuid: "SplittingFieldUnique")[
  #定理子句(
    条件: ([~$F$ 是#域], [$f : F[x]$], [$f != 0$]),
    结论: [$f$ 在 $F$ 上的#分裂域;存在且同构唯一],
  )
  // TODO: 证明（归纳：取 $f$ 的不可约因子 $g$，扩到 $F[x] slash (g)$，对剩下的 $f slash g$ 用归纳假设）。
]

== 代数闭包

#定义条目("代数闭域", "Algebraically Closed Field", uuid: "AlgebraicallyClosedField")[
  #定义子句(
    主体: [$F$ 是#代数闭域],
    isPredicate: true,
    内容: [$forall f : F[x], deg(f) >= 1 ==> exists alpha : F, f(alpha) = 0$；即 $F[x]$ 中所有非常数多项式都有根],
  )
  // TODO: 等价定义（$F[x]$ 中不可约多项式都是一次），例 $bb(C)$（代数基本定理）。
]

#定义条目("代数闭包", "Algebraic Closure", uuid: "AlgebraicClosure")[
  #定义子句(
    主体: [$F$ 的#代数闭包 $overline(F)$],
    内容: [$F$ 的#代数扩张;中最大的#代数闭域],
    记号: $overline(F)$,
  )
  // TODO: 存在性（Zorn / Artin），唯一性（同构）。例：$overline(bb(Q))$ 是代数数域，$overline(bb(R)) = bb(C)$。
]


= 可分扩张与有限域

== 可分性

#定义条目("可分多项式", "Separable Polynomial", uuid: "SeparablePolynomial")[
  #定义子句(
    条件: ([~$f : F[x]$, $f$ #不可约]),
    主体: [$f$ 是#可分多项式],
    isPredicate: true,
    内容: [$f$ 在#代数闭包 $overline(F)$ 中无重根],
  )
  // TODO: 等价：$gcd(f, f') = 1$；与导数判定连接。
]

#定义条目("可分扩张", "Separable Extension", uuid: "SeparableExtension")[
  #定义子句(
    条件: ([~$E slash F$ 是#代数扩张]),
    主体: [$E slash F$ 是#可分扩张],
    isPredicate: true,
    内容: [$forall alpha : E, m_alpha$ 是#可分多项式],
  )
]

#定义条目("完全域", "Perfect Field", uuid: "PerfectField")[
  #定义子句(
    主体: [$F$ 是#完全域],
    isPredicate: true,
    内容: [$F$ 的每个#代数扩张;都是#可分扩张],
  )
  // TODO: 等价：特征 0 或 Frobenius 满射；例 $bb(Q), bb(F)_p$ 是完全域。
]

== 有限域

#定义条目("有限域", "Finite Field", uuid: "FiniteField")[
  #定义子句(
    主体: [$F$ 是#有限域],
    isPredicate: true,
    内容: [$F$ 是#域;且作为集合元素个数有限],
  )
]

#定理条目("有限域结构定理", "Classification of Finite Fields", uuid: "FiniteFieldClassification")[
  #定理子句(
    条件: ([~$F$ 是#有限域]),
    结论: [$F$ 的元素个数为 $p^n$，其中 $p = $ #char($F$) 为素数，$n >= 1$；反之对任意素数 $p$ 与正整数 $n$，存在唯一（同构意义下）的 $p^n$ 元#有限域 $bb(F)_(p^n)$，它是 $x^(p^n) - x$ 在 $bb(F)_p$ 上的#分裂域],
  )
  // TODO: 证明骨架 + Frobenius 自同构 $alpha |-> alpha^p$ 的性质。
]


= Galois 理论

== 正规扩张与 Galois 扩张

#定义条目("正规扩张", "Normal Extension", uuid: "NormalExtension")[
  #定义子句(
    条件: ([~$E slash F$ 是#代数扩张]),
    主体: [$E slash F$ 是#正规扩张],
    isPredicate: true,
    内容: [$forall alpha : E, m_alpha$ 在 $E$ 中完全分裂（即 $E$ 包含 $m_alpha$ 的所有根）],
  )
  // TODO: 等价定义：$E$ 是 $F[x]$ 中某族多项式的#分裂域。
]

#定义条目("Galois 扩张", "Galois Extension", uuid: "GaloisExtension")[
  #结构子句(
    条件: ([~$E slash F$ 是#域扩张]),
    主体: [$E slash F$ 是#Galois扩张],
    isPredicate: true,
    extends: ([$E slash F$ 是#正规扩张], [$E slash F$ 是#可分扩张]),
    成员: (),
  )
]

== Galois 群

#定义条目("Galois 群", "Galois Group", uuid: "GaloisGroup")[
  #定义子句(
    条件: ([~$E slash F$ 是#域扩张]),
    主体: [$E slash F$ 的#Galois群 $Gal(E, F)$],
    内容: [所有固定 $F$ 的 $E$ 的#环自同构（即满足 $forall a : F, sigma(a) = a$ 的 $sigma : RAut(E)$）构成的子群],
    记号: Gal($E$, $F$),
  )
  // TODO: $|"Gal"(E slash F)| <= [E : F]$，等号当且仅当 $E slash F$ 是 Galois 扩张。
]

== Galois 对应

#定理条目("Galois 基本定理", "Fundamental Theorem of Galois Theory", uuid: "GaloisCorrespondence")[
  #定理子句(
    条件: ([~$E slash F$ 是#有限扩张 + #Galois扩张], [$G := Gal(E, F)$]),
    结论: [集合
      #setOf($K$, [$F subset.eq K subset.eq E and K$ 是#域])
      与
      #setOf($H$, [$H subset.eq G$ 是#子群])
      之间存在保包含逆序的双射：$K |-> Gal(E, K)$ 与 $H |-> E^H := #setOf($alpha$, type: $E$, $forall sigma : H, sigma(alpha) = alpha$)$；其中 $K slash F$ 是#Galois扩张;当且仅当 $Gal(E, K)$ 是 $G$ 的正规子群，此时 $Gal(K, F) tilde.equiv G slash Gal(E, K)$],
  )
  // TODO: 完整 statement（5 条），引入辅助 macro。
]


// TODO 后续章节铺垫:
//   - 代数无关 / 超越基 / 超越次数
//   - Galois 群计算技巧 (Lagrange resolvent, 等)
//   - 5 次方程不可根式解 (Abel-Ruffini)
//   - 分圆扩张 / Kronecker-Weber
//   - 局部域 / 类域论入口 (留给后续章)
