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

⍝ https://problems.tryapl.org/psets/2013.html?goto=P2_Making_The_Grade
⍝ 2: Making The Grade
⍝ Write a dfn which returns the percent (from 0 to 100) of passing (65 or higher) grades in a vector of grades.
percentage_passing ← {100 × ((65 ≤ ⍵) ⌿ ⍵) ÷⍥≢ ⍵}

assert 60  ≡ percentage_passing 25 90 100 64 65
assert 0   ≡ percentage_passing 50
assert 100 ≡ percentage_passing 80 90 100
assert 100 ≡ percentage_passing ⍳0 ⍝ all grades in an empty vector are passing
⎕ ← '02 ok'

⍝ https://problems.tryapl.org/psets/2013.html?goto=P3_What_Is_In_a_Word
⍝ 3: What Is In a Word
⍝ Write a dfn which returns the number of words in the given character scalar or vector.
⍝ For simplicity’s sake, you can consider the space character ' ' to be the only word separator.
count_words ← ≢ (⊂'') ~⍨ 1↓¨ ' '(=⊂⊢) ' ', ⊢

assert 4 ≡ count_words 'Testing one, two, three'
assert 0 ≡ count_words ''
assert 5 ≡ count_words ' this vector has extra blanks ' ⍝ just counting the blanks won't work
⎕ ← '03 ok'

⍝ https://problems.tryapl.org/psets/2013.html?goto=P4_Keeping_Things_In_Balance
⍝ 4: Keeping Things In Balance
⍝ Write an APL dfn which returns a 1 if the opening and closing parentheses in a character vector are balanced, or a zero otherwise.
balancedParen ← {(((|≡⊢) +⍀) ∧ 0=+/) (⍵='(')  - (⍵=')')}

assert 1 ≡ balancedParen '((2×3)+4)'
assert 1 ≡ balancedParen ''
assert 1 ≡ balancedParen 'hello world!'
assert 0 ≡ balancedParen ')(2×3)+4('
assert 0 ≡ balancedParen '(()'
assert 0 ≡ balancedParen ')'
⎕ ← '04 ok'

⍝ https://problems.tryapl.org/psets/2013.html?goto=P5_Identity_Crisis
⍝ 5: Identity Crisis
⍝ An identity matrix is a square matrix (table) of 0 with 1’s in the main diagonal.
⍝ Write an APL dfn which produces an n×n identity matrix.
identityMatrix ← {m ← ⍵ ⍵⍴0 ⋄ (0 0⍉m) ← ⍵/1 ⋄ m}

assert (1 1⍴1) ≡ identityMatrix 1
assert (0 0⍴0) ≡ identityMatrix 0