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