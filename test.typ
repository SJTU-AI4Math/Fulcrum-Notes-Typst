#set raw(theme: "vscode-light-modern.tmTheme")
#show raw : body => {
  block(
    fill: rgb("#EEEEEE"),
    inset: 10pt,
    radius: 5pt,
    body
  )
}

```Lean
import Mathlib

/-- An algebra of sets is closed by finite unions. -/
theorem biUnion_mem {ι : Type*} (h𝒜 : IsSetAlgebra 𝒜) {s : ι → Set α} (S : Finset ι)
    (hs : ∀ i ∈ S, s i ∈ 𝒜) : ⋃ i ∈ S, s i ∈ 𝒜 := h𝒜.isSetRing.biUnion_mem S hs

example : Meow := by sorry
```