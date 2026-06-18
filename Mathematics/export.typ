#import "../Fulcrum-Template-Typst/Fulcrum.typ": *

#import "03-Logic/export.typ": *
#import "03-SetTheory/export.typ": *
#import "03-TypeTheory/export.typ": *
#import "06-OrderTheory/export.typ": *
#import "08-BasicAlgebra/export.typ": *
#import "11-NumberTheory/export.typ": *
#import "12-FieldTheory/export.typ": *
#import "15-LinearAlgebra/export.typ": *
#import "15-RepresentationTheory/export.typ": *
#import "26-BasicAnalysis/export.typ": *
#import "28-MeasureTheory/export.typ": *
#import "34-OrdinaryDifferentialEquation/export.typ": *
#import "54-Topology/export.typ": *

#let FulcrumStyle = body => {
  show: FulcrumCN
  show: LogicStyle
  show: TypeStyle
  show: SetStyle
  show: AlgebraStyle
  show: FieldTheoryStyle
  show: LinearAlgebraStyle
  show: BasicAnalysisStyle
  show: MeasureTheoryStyle
  
  body
}