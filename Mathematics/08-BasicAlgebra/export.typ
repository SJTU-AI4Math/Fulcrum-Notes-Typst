#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let AlgebraStyle = body => {
  show math.sum : math.limits(optionLink("Algebra.sum", $sum$, url: "https://zh.wikipedia.org/wiki/%E6%B1%82%E5%92%8C%E7%AC%A6%E5%8F%B7"))
  body
}

#let 域 = optionLink(
  "Field",
  [域]
)