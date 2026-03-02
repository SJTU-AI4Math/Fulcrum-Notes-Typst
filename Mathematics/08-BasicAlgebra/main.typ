#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *
#import "../03-TypeTheory/main.typ": *
#import "../03-SetTheory/export.typ": *

#show : FulcrumCN
#show : SetStyle

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

#let 半群 = optionLink(
  "Semigroup",
  [半群]
)

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

#let 幺半群 = optionLink(
  "Monoid",
  [幺半群]
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
  - “单位元”又称“幺元”或恒等元
]

#let 幂 = optionLink(
  "Power",
  [幂]
)

#定义(
  "幂",
  "Power",
  hypotheses: ([ $(G, dot)$ 是#半群], $a : G$, $n : bb(N)$),
  [$a$ 的 $n$ 次幂],
  [
    $a^0 = e$,
    $a^(n+1) = a dot a^n$,
  ],
)

#性质(
  uuid: "identityUnique",
  "单位元唯一",
  "",
  hypotheses: ([ $(G, dot)$ 是#幺半群], $e' : G$, $forall a : G, e'a = a and a e' = a$),
  [$e' = e$],
)

