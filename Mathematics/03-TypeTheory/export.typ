#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let TypeStyle = body => {
  show math.colon : optionLink("TypeDecl", $:$, url: "https://zh.wikipedia.org/wiki/%E7%B1%BB%E5%9E%8B%E8%AE%BA")
  show math.forall : optionLink("DependentFunctionType", $forall$, url: "https://zh.wikipedia.org/wiki/%E5%85%A8%E7%A7%B0%E9%87%8F%E5%8C%96")
  show math.arrow : optionLink("FunctionType", $->$, url: "https://zh.wikipedia.org/wiki/%E5%87%BD%E6%95%B0")
  show math.mapsto : optionLink("LambdaAbstraction", $mapsto$, url: "https://zh.wikipedia.org/wiki/%CE%9B%E6%BC%94%E7%AE%97")
  body
}

#let implies = optionLink("Implies", $==>$, url: "https://zh.wikipedia.org/wiki/%E5%AE%9E%E8%B4%A8%E6%9D%A1%E4%BB%B6")

#let iff = optionLink("Iff", $<==>$)

#let structProp = (..members) => {
  set enum(indent: 0em);
  align(left)[
    $cases(#mRender(members.pos()))$
  ]
}

#let Prop = optionLink("Prop", [$op("Prop")$], url: "https://zh.wikipedia.org/wiki/%E5%91%BD%E9%A2%98")

#let Type = optionLink("Type", [$op("Type")$], url: "https://zh.wikipedia.org/wiki/%E7%B1%BB%E5%9E%8B%E8%AE%BA")


#let Nat = optionLink("NaturalNumber", $bb(N)$, url: "https://zh.wikipedia.org/wiki/%E8%87%AA%E7%84%B6%E6%95%B0")

#let Real = optionLink("RealNumber", $bb(R)$, url: "https://zh.wikipedia.org/wiki/%E5%AE%9E%E6%95%B0")

#let PReal = optionLink("RealNumber", $bb(R)_+$, url: "https://zh.wikipedia.org/wiki/%E6%AD%A3%E6%95%B0")

#let ENNReal = optionLink("ENNReal", $macron(bb(R))_(>= 0)$, url: "https://zh.wikipedia.org/wiki/%E6%93%B4%E5%B1%95%E5%AF%A6%E6%95%B8%E7%B7%9A")

#let EReal = optionLink("EReal", $macron(bb(R))$, url: "https://zh.wikipedia.org/wiki/%E6%93%B4%E5%B1%95%E5%AF%A6%E6%95%B8%E7%B7%9A")

#let 两两 = optionLink("Pairwise", [两两])

#let Curry化 = optionLink(
  "Currying",
  [Curry 化],
  url: "https://zh.wikipedia.org/wiki/%E6%9F%AF%E9%87%8C%E5%8C%96"
)

#let quot = optionLink(
  "QuotientType",
  $\/$,
)