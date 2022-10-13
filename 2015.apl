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
