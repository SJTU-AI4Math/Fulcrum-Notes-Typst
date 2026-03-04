#import "../../Fulcrum-Template-Typst/Fulcrum.typ": *

#let 线性空间 = optionLink(
  "LinearSpace",
  [线性空间]
)

#let GL = (V) => $
  #optionLink("GeneralLinearGroup", $op("GL")$) (#V)
$