⎕IO ← 0
assert←{⍺←'assertion failure' ⋄ 0∊⍵:⍺ ⎕signal 8 ⋄ shy←0}

⍝ https://problems.tryapl.org/psets/2015.html
⍝ 1: Nag A Ram
⍝ Write a function that takes two character vectors as its left and right arguments and returns 1 if they are anagrams of each other. An anagram of a string uses all of the letters of the string ignoring word spacing, capitalisation, and punctuation.
isAnagram ← ≡⍥{{(⊂⍋⍵)⌷⍵}w/⍨⎕A∊⍨w←1 ⎕C ⍵}
isAnagram ← (≡⍥{{⍵[⍋⍵]}⍵∩⍥⎕C ⎕A})

assert 1 ≡ 'anagram' isAnagram 'Nag A Ram' 
assert 1 ≡ 'Dyalog APL' isAnagram 'Dog Pay All' 
assert 1 ≡ '' isAnagram '  !#!' 
assert 0 ≡ 'abcde' isAnagram 'zyxwvu'
⎕ ← '01 ok'



⍝ https://problems.tryapl.org/psets/2015.html?goto=P2_Longest_Streak
⍝ 2: Longest Streak
⍝ Write a function that takes a numeric vector and returns the length of the longest streak of positive growth.
longestStream ← {0=⍴⍴⍵:0 ⋄ ⌈/ 0, ≢¨ ⍵⊆⍨ 0, 2</⍵}
longestStream ← {0⌈⌈/≢¨⊆⍨2</,⍵}

assert 8 ≡ longestStream 1 2 3 4 5 6 7 8 9 
assert 0 ≡ longestStream 1 
assert 0 ≡ longestStream 9 8 7 6 5 4
assert 3 ≡ longestStream 1 5 3 4 2 6 7 8
⎕ ← '02 ok'



⍝ https://problems.tryapl.org/psets/2015.html?goto=P3_Farey_Tale
⍝ 3: Farey Tale
⍝ In mathematics, the Farey_sequence of order n is the sequence of completely reduced fractions between 0 and 1 which, when in lowest terms, have denominators less than or equal to n, arranged in order of increasing size. Each Farey sequence starts with the value 0, denoted by the fraction 0⁄1, and ends with the value 1, denoted by the fraction 1⁄1.
⍝ Write a function that takes an integer right argument and returns a vector of the terms in the Farey sequence of that order. Each element in the returned vector is itself a 2-element vector of numerator and denominator for the corresponding term.
farey ← {⍺ ← (0 1)(1 ⍵) ⋄ (a b)(c d) ← ¯2↑⍺ ⋄ c>⍵: ¯1↓⍺ ⋄ k←⌊(⍵ + b) ÷ d ⋄ (⍺, ⊂(a -⍨ k × c) (b -⍨ k × d))∇⍵}

assert farey 0 ≡ ⊂(0 1)
assert farey 1 ≡ (0 1)(1 1)
assert farey 5 ≡ (0 1)(1 5)(1 4)(1 3)(2 5)(1 2)(3 5)(2 3)(3 4)(4 5)(1 1)
⎕ ← '03 ok'



⍝ https://problems.tryapl.org/psets/2015.html?goto=P4_PDI_Progressive_Dyadic_Iota
⍝ 4: PDI - Progressive Dyadic Iota
⍝ The index-of function X⍳Y returns a simple integer vector that identifies where the major cells of Y are first found in X. If a major cell of Y cannot be found in X, then the corresponding item of the returned array will be 1+≢X.
⍝ Example of X⍳Y:
⍝      'DYALOG APL' ⍳ 'AAALLLB' 
⍝ 3 3 3 4 4 4 11
⍝ Progressive dyadic iota is similar to ⍳ except that it returns the index of subsequent matches in the left argument until they are exhausted. Write a function that implements progressive dyadic iota.
dIota ← {i←⍺ ⋄ s←{↓(↑⍵ (((⎕IO+≢i)/⍨(≢⍵)-(≢m)),⍨m←⍸i=⍺))}⌸⍵ ⋄ (∊(1+⎕IO)⌷⍉s)[∊⎕IO⌷⍉s]}

assert 2 7 10 3 9 10 10 ≡ 'DYALOG APL' dIota 'AAALLLB' 
assert 0 0 0 0 ≡ '' dIota 'test'  ⍝ should work with empty left argument 
assert ⍬ ≡ 'test' dIota ''  ⍝ should work with empty right argument
