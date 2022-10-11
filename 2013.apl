⎕IO ← 0
assert←{⍺←'assertion failure' ⋄ 0∊⍵:⍺ ⎕signal 8 ⋄ shy←0}

⍝ https://problems.tryapl.org/psets/2013.html
⍝ 1: Seems a Bit Odd To Me
⍝ Write a dfn to produce a vector of the first n odd numbers.
odd ← 1 + 2 × ⍳

assert 1 3 5 7 9 11 13 15 17 19 ≡ odd 10
assert (1⍴1) ≡ odd 1
assert (0⍴1) ≡ odd 0
⎕ ← '01 ok'

