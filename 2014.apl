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



⍝ https://problems.tryapl.org/psets/2014.html?goto=P6_Roll_The_Dice
⍝ 6: Roll The Dice
⍝ Write a dfn that takes an integer vector representing the sides of a number of dice and returns a 2 column matrix of the number of ways each possible total of the dice can be rolled.
totalPossibleRolls ← {⍺ (≢⍵)}⌸(×/)⍴(+/¨1+⍳)

assert totalPossibleRolls 6 6 ≡ ↑(2 1)(3 2)(4 3)(5 4)(6 5)(7 6)(8 5)(9 4)(10 3)(11 2)(12 1) ⍝ 2 six-sided dice
assert totalPossibleRolls 6 4 ≡ ↑(2 1)(3 2)(4 3)(5 4)(6 4)(7 4)(8 3)(9 2)(10 1) ⍝ a six-sided and a four-sided die
assert totalPossibleRolls 3  ≡ ↑(1 1)(2 1)(3 1) ⍝ a single 3-sided die
assert totalPossibleRolls ⍬ ≡ ↑(0 1) ⍝ no dice
⎕ ← '06 ok'



⍝ https://problems.tryapl.org/psets/2014.html?goto=P7_Revolutionary_Thinking
⍝ 7: Revolutionary Thinking
⍝ Imagine there are two circles that are tangent to one another. One circle is stationary, the other can “roll” around the stationary circle.  
⍝          .--.
⍝         /    \  .-.
⍝         \    / (   )
⍝          '--'   '-'
⍝ Write a dfn which takes the diameters of the stationary and mobile circles and returns the number of revolutions the mobile must traverse until the tangent points meet again.
countRevolutions ← {¯1+ ⍵÷⍨ (⍵∘+⍣{0=1|⍵}) ⍵}

1 ≡ 10 countRevolutions 10 ⍝ identically sized circles
2 ≡ 10 countRevolutions  5 ⍝ a mobile circle that's half the size needs to make 2 revolutions
5 ≡  5 countRevolutions  7 ⍝ a mobile circle of diameter 7 needs to make 5 revolutions around a stationary circle of diameter 5
⎕ ← '07 ok'