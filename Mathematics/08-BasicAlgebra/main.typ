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

#结构(
  uuid: "Semigroup",
  "半群",
  "Semigroup",
  [$(G, dot)$ 是#半群],
  isPredicate: true,
  (
    (name: [结合律], name_en: [Associativity], value: [$forall (a, b, c : G), (a dot b) dot c = a dot (b dot c)$]),
  ),
)

#注[通常书写时省略乘号“$dot$”，即将 $a dot b$ 写作 $a b$。]

#定义(
  "自然数幂",
  "NatPower",
  hypotheses: ([ $(G, dot)$ 是#半群], $a : G$, $n : bb(N)$),
  [$a$ 的 $n$ 次幂],
  bstyle: "display",
  [

    对 $n$ 进行归纳，
    - 若 $n = 0$，$e$；
    - 若 $n = m + 1$，$a dot a^m$,
  ],
)

#结构(
  uuid: "Monoid",
  "幺半群",
  "Monoid",
  extends: ([#半群],),
  [$(G, dot)$ 是#幺半群],
  (
    (name: [单位元], name_en: [Identity], varName: $e$, value: $G$),
    (name: [单位元左乘不变性], value: [$forall (a : G), e dot a = a$]),
    (name: [单位元右乘不变性], value: [$forall (a : G), a dot e = a$]),
  ),
)

#注[
  - “单位元”又称“幺元”或“恒等元”
]

#性质(
  uuid: "MonoidIdentityUnique",
  "幺半群中单位元唯一",
  "",
  hypotheses: ([ $(G, dot)$ 是#幺半群], $e' : G$, $forall a : G, e'a = a and a e' = a$),
  [$e' = e$],
)

#结构(
  uuid: "Group",
  "群",
  "Group",
  extends: ([#幺半群],),
  [$(G, dot)$ 是#群],
  (
    (name: [逆元], name_en: [Inverse], varName: $dot^(-1)$, value: $G -> G$),
    (name: [逆元左乘律], value: [$forall (a : G), a^(-1) dot a = e$]),
    (name: [逆元右乘律], value: [$forall (a : G), a dot a^(-1) = e$]),
  ),
)

== 同态

#约定[
  - $G, H : Type$
  - $dot_G : G -> G -> G$
  - $dot_H : H -> H -> H$
  - $(G, dot_G), (H, dot_H)$ 是#群
  - $f : G -> H$
]

#结构(
  uuid: "GroupHomomorphism",
  "群同态",
  "Group Homomorphism",
  [$f$ 是 $G$ 到 $H$ 的#群同态],
  isPredicate: true,
  (
    (name: [保持恒等元], value: [$f(e_G) = e_H$]),
    (name: [保持乘法], value: [$forall (a, b : G), f(a dot_G b) = f(a) dot_H f(b)$]),
  ),
  notation: [$GHom(G, H)$],
)

#性质(
  uuid: "GroupHomomorphismIff",
  "群同态等价定义",
  "",
  hypotheses: ([ $forall a,b : G, $],),
  [$GHom(G, H)$]
)

#结构(
  uuid: "GroupMonomorphism",
  "群单同态",
  "Group Monomorphism",
  extends: ([ $f$ 是#群同态],),
  [$f$ 是 $G$ 到 $H$ 的群单同态],
  (
    (name: [单射], value: [$f$ 是单射]),
  ),
  notation: [$G GMono H$],
)

#结构(
  uuid: "GroupEpimorphism",
  "群满同态",
  "Group Epimorphism",
  extends: ([ $f$ 是#群同态],),
  [$f$ 是 $G$ 到 $H$ 的群满同态],
  (
    (name: [满射], value: [$f$ 是满射]),
  ),
  notation: [$G GEpi H$],
  extention: true
)

#结构(
  uuid: "GroupIsomorphism",
  "群同构",
  "Group Isomorphism",
  hypotheses: ([#link(<GroupMonomorphism>, [同上])],),
  extends: ([#群同态],),
  [$G$ 到 $H$ 的群同构],
  (
    (name: [同态], varName: [$f,g$], value: [$GHom(G,H)$]),
    (name: [互逆], value: [$f compose g = g compose f = 1$])
  ),
  notation: [$G GIso H$],
)

#性质(
  uuid: "GroupBijectionIsomorphism",
  "群双射是同构",
  "",
  hypotheses: ([ $f : GHom(G, H)$, $f$ 是双射],),
  [$G GIso H$],
)

== 子群

#约定[
  - $G : Type$
  - $dot_G : G -> G -> G$
  - $(G, dot_G)$ 是#群
]

#let SubG = $#optionLink("Subgroup", $<=$)$
#let PSubG = $#optionLink("ProperSubgroup", $<$)$

#定义(
  uuid: "Subgroup",
  "子群",
  "Subgroup",
  hypotheses: ([ $H : Set(G)$],),
  [$H$ 是 $G$ 的子群],
  isPredicate: true,
  [ $(H, dot_G)$ 是#群],
  notation: [$H SubG G$],
)

#定义(
  uuid: "ProperSubgroup",
  "真子群",
  "Proper Subgroup",
  hypotheses: (link(<Subgroup>, [同上]),),
  [$H$ 是 $G$ 的真子群],
  isPredicate: true,
  isExtension: true,
  [ $H SubG G and H != G$],
  notation: [$H PSubG G$],
)

#性质(
  uuid: "TrivialSubgroup",
  [平凡子群],
  [Trivial Subgroup],
  cstyle: "display",
  $ #structProp(
    (name: "1 子群", value: $(1, dot) SubG G$),
    (name: "全子群", value: $(G, dot) SubG G$)
  ) $,
)



== 置换群

== 群作用

#context if 看不看范畴论.get() [

== 群范畴

]