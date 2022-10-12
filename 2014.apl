⎕IO ← 0
assert←{⍺←'assertion failure' ⋄ 0∊⍵:⍺ ⎕signal 8 ⋄ shy←0}

⍝ https://problems.tryapl.org/psets/2014.html
⍝ 1: It Is All Right
⍝ Write a dfn that takes the length of the legs of a triangle as its left argument, and the length of the hypotenuse as its right argument and returns 1 if the triangle is a right triangle, 0 otherwise.
isRightTriangle ← {(+/⍺*2)=(⍵*2)}

assert 1 ≡ 3 4 isRightTriangle 5
assert 0 ≡ 2 3 isRightTriangle 4
⎕ ← '01 ok'



⍝ https://problems.tryapl.org/psets/2014.html?goto=P2_How_Tweet_It_Is
⍝ 2: How Tweet It Is
⍝ Twitter messages have a 140 character limit; what if the limit was even shorter? One way to shorten the message yet retain most readability is to remove interior vowels from its words. Write a dfn which takes a character vector and removes the interior vowels from each word.
removeInteriorVowels ← {3> ≢⍵:⍵ ⋄ ⍵/⍨ ((∊∘'AEIOU') ⍲ (0,0,⍨ 3∧/ ' '≠⊢)) 1⎕C ⍵}

assert 'if yu cn rd ths, it wrkd!' ≡ removeInteriorVowels 'if you can read this, it worked!'
assert 'APL is RLLY cl' ≡ removeInteriorVowels 'APL is REALLY cool'
assert '' ≡ removeInteriorVowels '' ⍝ an empty vector arg should return an empty vector
assert 'a' ≡ removeInteriorVowels 'a' ⍝ should work with a single character message
⎕ ← '02 ok'



⍝ https://problems.tryapl.org/psets/2014.html?goto=P3_Tell_a_Fib
⍝ 3: Tell a Fib
⍝ Write a dfn that takes an integer right argument and returns that number of terms in the Fibonacci sequence.
fib ← {⍺ ← 1 1 ⋄ ⍵=0: ⊃⍺ ⋄ (1↓⍺, +/⍺)∇(⍵-1)}¨⍳

assert (1 1 2 3 5 8 13 21 34 55) ≡ fib 10
assert (,1) ≡ fib 1
assert ⍬   ≡ fib 0 ⍝ should return an empty vector
⎕ ← '03 ok'



⍝ https://problems.tryapl.org/psets/2014.html?goto=P4_Space_The_Final_Frontier
⍝ 4: Space The Final Frontier
⍝ Write a dfn that removes extraneous (leading, trailing, and multiple) spaces from a character vector.
rmExtraSpaces ← 1↓ ∘ ∊ ' ',¨ ' '∘(≠⊆⊢)

assert 'this is a test' ≡ rmExtraSpaces '  this  is a   test  '
assert ''               ≡ rmExtraSpaces '' ⍝ should return an empty vector
assert 'hello world!'   ≡ rmExtraSpaces 'hello world!'
assert ''               ≡ rmExtraSpaces '  ' ⍝ vector of only spaces should return empty vector
⎕ ← '04 ok'



⍝ https://problems.tryapl.org/psets/2014.html?goto=P5_Mirror_Mirror
⍝ 5: Mirror Mirror
⍝ A palindrome is a word or phrase whose letters read the same forwards and backwards. Write a dfn which returns a 1 if its character vector argument is a palindrome, 0 otherwise. For simplicity’s sake, you may assume that the vector is all one case.
isPalindrome ← {p≡⌽p←⍵/⍨ ⎕A∊⍨ 1⎕C ⍵}

assert 1 ≡ isPalindrome 'a man, a plan, a canal, panama!'
assert 1 ≡ isPalindrome '' ⍝ a phrase of 0 length is a palindrome
assert 1 ≡ isPalindrome 'a' ⍝ as is a single letter phrase
assert 0 ≡ isPalindrome 'APL' ⍝ APL may be cool, but it's not a palindrome
⎕ ← '05 ok'