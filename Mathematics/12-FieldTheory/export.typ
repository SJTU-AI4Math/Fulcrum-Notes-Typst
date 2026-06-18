#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

// FieldTheory chapter: terms / macros / show-rule

#let FieldTheoryStyle = body => {
  body
}

// 域扩张
#let 域扩张 = optionLink("FieldExtension", [域扩张])
#let 扩张次数 = optionLink("ExtensionDegree", [扩张次数])
#let 有限扩张 = optionLink("FiniteExtension", [有限扩张])
#let 代数扩张 = optionLink("AlgebraicExtension", [代数扩张])
#let 超越扩张 = optionLink("TranscendentalExtension", [超越扩张])

// 元素分类
#let 代数元 = optionLink("AlgebraicElement", [代数元])
#let 超越元 = optionLink("TranscendentalElement", [超越元])
#let 极小多项式 = optionLink("MinimalPolynomial", [极小多项式])
#let 单代数扩张 = optionLink("SimpleAlgebraicExtension", [单代数扩张])

// 分裂域 / 代数闭包
#let 分裂域 = optionLink("SplittingField", [分裂域])
#let 代数闭包 = optionLink("AlgebraicClosure", [代数闭包])
#let 代数闭域 = optionLink("AlgebraicallyClosedField", [代数闭域])

// 可分 / 完全
#let 可分多项式 = optionLink("SeparablePolynomial", [可分多项式])
#let 可分扩张 = optionLink("SeparableExtension", [可分扩张])
#let 完全域 = optionLink("PerfectField", [完全域])

// 有限域
#let 有限域 = optionLink("FiniteField", [有限域])

// Galois
#let 正规扩张 = optionLink("NormalExtension", [正规扩张])
#let Galois扩张 = optionLink("GaloisExtension", [Galois 扩张])
#let Galois群 = optionLink("GaloisGroup", [Galois 群])
#let Galois对应 = optionLink("GaloisCorrespondence", [Galois 对应])

// 操作符 macros
#let Gal = (E, F) => $#optionLink("GaloisGroup", $op("Gal")$) (#E slash #F)$
#let degExt = (E, F) => $[#E : #F]$
