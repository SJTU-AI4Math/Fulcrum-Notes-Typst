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