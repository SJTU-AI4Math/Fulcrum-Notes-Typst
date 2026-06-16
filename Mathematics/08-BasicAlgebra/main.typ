#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "../03-TypeTheory/main.typ": *
#import "../03-TypeTheory/export.typ": *
#import "../03-SetTheory/export.typ": *
#import "export.typ": *

#show : FulcrumCN
#show : SetStyle

#let 看不看范畴论 = state("CategoryTheoryVisible", true)
#let 我不看范畴论 = context {
  看不看范畴论.update(false)
  []
}

#我不看范畴论

// 标题
#align(center)[
  #block(text(weight: "bold", size: 2em)[基础代数学])
]

= 群论

#约定[
  - $G : Type$
  - $("_" dot "_") : G -> G -> G$
]

== 基本定义

#结构条目("半群", "Semigroup", uuid: "Semigroup")[
  #结构子句(
    主体: [$(G, dot)$ 是#半群],
    isPredicate: true,
    成员: (
      (name: [结合律], name_en: [Associativity], value: [$forall (a, b, c : G), (a dot b) dot c = a dot (b dot c)$]),
    ),
  )
]

#注条目("", "")[通常书写时省略乘号“$dot$”，即将 $a dot b$ 写作 $a b$。]

#定义条目("自然数幂", "NatPower")[
  #定义子句(
    条件: ([$(G, dot)$ 是#半群], $a : G$, $n : bb(N)$),
    主体: [$a$ 的 $n$ 次幂],
    bstyle: "display",
    内容: [
      对 $n$ 进行归纳，
      - 若 $n = 0$，$e$；
      - 若 $n = m + 1$，$a dot a^m$,
    ],
  )
]

#结构条目("幺半群", "Monoid", uuid: "Monoid")[
  #结构子句(
    主体: [$(G, dot)$ 是#幺半群],
    extends: ([#半群],),
    成员: (
      (name: [单位元], name_en: [Identity], varName: $e$, value: $G$),
      (name: [单位元左乘不变性], value: [$forall (a : G), e dot a = a$]),
      (name: [单位元右乘不变性], value: [$forall (a : G), a dot e = a$]),
    ),
  )
]

#注条目("", "")[
  - “单位元”又称“幺元”或“恒等元”
]

#性质条目("幺半群中单位元唯一", "", uuid: "MonoidIdentityUnique")[
  #定理子句(
    条件: ([$(G, dot)$ 是#幺半群], $e' : G$, $forall a : G, e'a = a and a e' = a$),
    结论: [$e' = e$],
  )
]

#结构条目("群", "Group", uuid: "Group")[
  #结构子句(
    主体: [$(G, dot)$ 是#群],
    extends: ([#幺半群],),
    成员: (
      (name: [逆元], name_en: [Inverse], varName: $dot^(-1)$, value: $G -> G$),
      (name: [逆元左乘律], value: [$forall (a : G), a^(-1) dot a = e$]),
      (name: [逆元右乘律], value: [$forall (a : G), a dot a^(-1) = e$]),
    ),
  )
]

== 同态

#约定[
  - $G, H : Type$
  - $dot_G : G -> G -> G$
  - $dot_H : H -> H -> H$
  - $(G, dot_G), (H, dot_H)$ 是#群
  - $f : G -> H$
]

#结构条目("群同态", "Group Homomorphism", uuid: "GroupHomomorphism")[
  #结构子句(
    主体: [$f$ 是 $G$ 到 $H$ 的#群同态],
    isPredicate: true,
    成员: (
      (name: [保持恒等元], value: [$f(e_G) = e_H$]),
      (name: [保持乘法], value: [$forall (a, b : G), f(a dot_G b) = f(a) dot_H f(b)$]),
    ),
    记号: [$GHom(G, H)$],
  )
]

#性质条目("群同态等价定义", "", uuid: "GroupHomomorphismIff")[
  #定理子句(
    条件: ([$forall a,b : G,$],),
    结论: [$GHom(G, H)$],
  )
]

#结构条目("群单同态", "Group Monomorphism", uuid: "GroupMonomorphism")[
  #结构子句(
    主体: [$f$ 是 $G$ 到 $H$ 的群单同态],
    extends: ([$f$ 是#群同态],),
    成员: (
      (name: [单射], value: [$f$ 是单射]),
    ),
    记号: [$G GMono H$],
  )
]

#结构条目("群满同态", "Group Epimorphism", uuid: "GroupEpimorphism")[
  #结构子句(
    主体: [$f$ 是 $G$ 到 $H$ 的群满同态],
    extends: ([$f$ 是#群同态],),
    成员: (
      (name: [满射], value: [$f$ 是满射]),
    ),
    记号: [$G GEpi H$],
  )
]

#结构条目("群同构", "Group Isomorphism", uuid: "GroupIsomorphism")[
  #结构子句(
    主体: [$G$ 到 $H$ 的群同构],
    条件: ([#link(<GroupMonomorphism>, [同上])],),
    extends: ([#群同态],),
    成员: (
      (name: [同态], varName: [$f,g$], value: [$GHom(G,H)$]),
      (name: [互逆], value: [$f compose g = g compose f = 1$]),
    ),
    记号: [$G GIso H$],
  )
]

#性质条目("群双射是同构", "", uuid: "GroupBijectionIsomorphism")[
  #定理子句(
    条件: ([$f : GHom(G, H)$, $f$ 是双射],),
    结论: [$G GIso H$],
  )
]

== 子群

#约定[
  - $G : Type$
  - $dot_G : G -> G -> G$
  - $(G, dot_G)$ 是#群
]

#let SubG = $#optionLink("Subgroup", $<=$)$
#let PSubG = $#optionLink("ProperSubgroup", $<$)$

#定义条目("子群", "Subgroup", uuid: "Subgroup")[
  #定义子句(
    条件: ([$H : Set(G)$],),
    主体: [$H$ 是 $G$ 的子群],
    isPredicate: true,
    内容: [$(H, dot_G)$ 是#群],
    记号: [$H SubG G$],
  )
]

#定义条目("真子群", "Proper Subgroup", uuid: "ProperSubgroup")[
  #定义子句(
    条件: (link(<Subgroup>, [同上]),),
    主体: [$H$ 是 $G$ 的真子群],
    isPredicate: true,
    内容: [$H SubG G and H != G$],
    记号: [$H PSubG G$],
  )
]

#性质条目([平凡子群], [Trivial Subgroup], uuid: "TrivialSubgroup")[
  #定理子句(
    结论: $ #structProp(
      (name: "1 子群", value: $(1, dot) SubG G$),
      (name: "全子群", value: $(G, dot) SubG G$)
    ) $,
    cstyle: "display",
  )
]


== 置换群

#约定[
  - $X : Type$
]

#定义条目("置换", "Permutation")[
  // TODO: 集合 $X$ 上的置换, 即 $X -> X$ 的双射。
]

#定义条目("对称群", "Symmetric Group")[
  // TODO: $X$ 上全体置换在复合运算下构成的群 $"Sym"(X)$。
  // 当 $X = {1, ..., n}$ 时记为 $S_n$。
]

#定义条目("轮换", "Cycle")[
  // TODO: $r$ 阶轮换 $(a_1, a_2, ..., a_r)$ 的定义。
]

#定义条目("不交轮换", "Disjoint Cycles")[
  // TODO: 两个轮换作用的元素集合不相交。
]

#定理条目("轮换分解定理", "Cycle Decomposition")[
  // TODO: 任何置换可唯一分解为不交轮换的乘积（不计顺序）。
]

#定义条目("对换", "Transposition")[
  // TODO: 2 阶轮换。
]

#定义条目("奇置换与偶置换", "Even/Odd Permutation")[
  // TODO: 可表示为偶数（奇数）个对换乘积的置换。
]

#性质条目("奇偶性不依赖于分解", "")[
  // TODO: 其同一置换不同的对换分解的長度奇偶性相同。
]

#定义条目("交错群", "Alternating Group")[
  // TODO: $S_n$ 中所有偶置换构成的子群 $A_n$。
]

#定理条目("Cayley 定理", "Cayley")[
  // TODO: 任何群 $G$ 同构于 $"Sym"(G)$ 的子群。
]


== 群作用

#约定[
  - $G : Type$
  - $X : Type$
  - $(G, dot)$ 是#群
]

#定义条目("群作用", "Group Action")[
  // TODO: 运算 $alpha : G -> X -> X$ 满足单位元作用与结合律。
]

#定义条目("轨道", "Orbit")[
  // TODO: $x in X$ 的轨道 $G dot x = { g dot x | g in G }$。
]

#定义条目("稳定子群", "Stabilizer")[
  // TODO: $"Stab"(x) = { g in G | g dot x = x }$，$G$ 的子群。
]

#性质条目("轨道是集合的等价类", "")[
  // TODO: 对 $X$ 定义关系 $x tilde y$ 以 $exists g, g dot x = y$, 为等价关系。
  // $X$ 以轨道为等价类。
]

#定理条目("轨道-稳定子定理", "Orbit-Stabilizer")[
  // TODO: 有限群 $G$ 作用于 $X$, $forall x in X$, $|G dot x| dot |"Stab"(x)| = |G|$。
]

#定义条目("不动点集", "Fixed Point Set")[
  // TODO: $X^g = { x in X | g dot x = x }$。
]

#引理条目("Burnside 计数引理", "Burnside")[
  // TODO: 有限群 $G$ 作用于有限集 $X$, 轨道数 $|X \/ G| = (1 / |G|) sum_(g in G) |X^g|$。
]

#定义条目("共轭作用", "Conjugation Action")[
  // TODO: $G$ 作用于自身: $g dot x = g x g^(-1)$。
]

#定义条目("共轭类", "Conjugacy Class")[
  // TODO: 共轭作用下的轨道。
]

#定义条目("中心化子", "Centralizer")[
  // TODO: $C_G(x) = { g in G | g x = x g }$，即共轭作用的稳定子群。
]

#定义条目("中心", "Center")[
  // TODO: $Z(G) = { g in G | forall x in G, g x = x g }$，$G$ 的交换中心子群。
]

#定理条目("类方程", "Class Equation")[
  // TODO: 有限群 $|G| = |Z(G)| + sum_i [G : C_G(x_i)]$，其中求和跨非心共轭类代表。
]


#context if 看不看范畴论.get() [

== 群范畴

#定义条目("群范畴", "Category of Groups")[
  // TODO: 范畴 $bold("Grp")$, 对象为一切群, 态射为群同态。
]

#性质条目("群范畴中的同构", "")[
  // TODO: $bold("Grp")$ 中同构 即 群同构。
]

#定义条目("群直积", "Direct Product of Groups")[
  // TODO: $G times H$ 上的逐分量乘法, 为 $bold("Grp")$ 中的积。
]

#定义条目("群余积", "Coproduct in Group Category")[
  // TODO: $bold("Grp")$ 中的余积 即 自由积 G * H。
]

#性质条目("群范畴是完备与余完备的", "")[
  // TODO: $bold("Grp")$ 有全部小极限与小余极限。
]

]