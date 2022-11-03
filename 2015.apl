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
⎕ ← '04 ok'



⍝ https://problems.tryapl.org/psets/2015.html?goto=P5_Hes_so_mean_he_has_no_standard_deviation
⍝ 5: He’s so mean, he has no standard deviation
⍝ The standard deviation of a population is calculated by taking the square root of the average of the squared differences of the values from their average value. The mathematical formula is:
⍝       /  Σ (x - x̄)²
⍝    \ /  -----------
⍝     √        n
⍝ where x̄ is the mean average value and n is the number of values.
⍝ Write a function that returns the population standard deviation of its numeric array right argument.
standDevi ← {avg←((+⌿÷≢)⍣(⊃⍴⍴⍵)) ⍵ ⋄ 0.5 *⍨ (×/⍴⍵) ÷⍨ (+/⍣(⊃⍴⍴⍵)) 2 *⍨ ⍵ - avg}

assert 1E¯10  ≥ 1.414213562 - standDevi 1 2 3 4 5
assert 1E¯10  ≥ .86607005 - standDevi 10 10⍴⍳100  ⍝ and higher dimensions as well
⎕ ← '05 ok'



⍝ https://problems.tryapl.org/psets/2015.html?goto=P6_Hey_This_is_My_Space
⍝ 6: Hey! This is My Space
⍝ Write a function that takes, as each of its right and left arguments, a pair of co-ordinates representing diagonally opposite corners of two rectangles and returns a 1 if the rectangles overlap. The co-ordinates could be either (upper-left, lower-right) or (upper-right, lower left).
⍝   ┌───┐
⍝   │ ┌─┼─┐
⍝   └─┼─┘ │
⍝     └───┘
overlap ← {2≠+/(↑⍺)⍸(↑⍵)}

assert 1 ≡ (1 1)(5 5) overlap (3 3)(7 7)
assert 1 ≡ (1 1)(5 5) overlap (5 5)(1 1)
assert 0 ≡ (1 1)(3 3) overlap (4 4)(7 7)
assert 1 ≡ (1.1 1.1)(5.5 5.5) overlap (3.3 3.3)(4.4 4.4)
⍝ assert 0 ≡ (6 1)(2 3) overlap (8 8)(3 5)
⎕ ← '06 ok (basic)'



⍝ https://problems.tryapl.org/psets/2015.html?goto=P7_Just_In_Upper_Case
⍝ 7: Just in (Upper) Case
⍝ Membership X∊Y returns a boolean array of shape ⍴X with 1s indicating where elements of Y occur in X. For a vector X this results in a very convenient boolean mask.
⍝ In many instances, it is desirable to perform case-insensitive comparisons and operations. Write a function to perform case-insensitive membership between two arrays.
⍝ For full marks, consider membership of cells in high-rank arrays, your function should still return a vector when comparing cells of the same rank, for example (3 2⍴⎕A) and (1 2⍴'cd').
contains_insensitive ← {⊃ ∨/ =∘(1⎕C ⍺) ¨ 1⎕C ⍵}

assert 0 0 1 1 0 0 ≡ 'dyalog' contains_insensitive 'APL'
assert 0 1 1 1 0 1 0 ≡ 'bramley' contains_insensitive 'HAMPSHIRE'
⍝ assert 0 0 0 1 0 ≡ 5 2⍴'IJEFABCDGH' contains_insensitive 1 2⍴'CD'
⎕ ← '07 ok (basic)'



⍝ https://problems.tryapl.org/psets/2015.html?goto=P8_Unlucky_13
⍝ 8: Unlucky 13
⍝ You’ve just been hired by a new company and you’ve learned that the owner has triskaidekaphobia (fear of the number 13). As such he’s issued a corporate mandate that no output from any program shall include the number 13 – 12.99 will be used instead. Your boss wants you to implement a function to process output and change the 13s to 12.99. For now, you need only concern yourself with numeric data and not worry about 13s that are formatted in text.
replace13 ← 12.99@(=∘13)

assert 12.99 ≡ replace13 13
assert 0 1 2 3 4 5 6 7 8 9 10 11 12 12.99 14 ≡ replace13 ⍳15 
assert 11 12 12.99 14 15 ≡ replace13 6+5 6 7 8 9
assert 12.99 130 13.13 1300 ≡ replace13 13 130 13.13 1300  ⍝ we only care about the number 13
⎕ ← '08 ok'



⍝ https://problems.tryapl.org/psets/2015.html?goto=P9_Id_Like_Mine_Scrambled_Please
⍝ 9: I’d Like Mine Scrambled Please
⍝ There is an urban myth about some research that was supposedly done at Cambridge University that purports changing the order of the interior letters in the words of a sentence does not significantly hamper the readability of the sentence.
⍝ Put another way…
⍝ Teher is an ubran mtyh aobut smoe rseaecrh taht was spuopesldy dnoe at Cmarbdige Uinevsrtiy taht pruoptrs cahgnnig the odrer of the itnreoir lteetrs in the wrods of a sneetcne deos not sgiinifactnly hmaepr the raeadibilty of the sneetcne.
⍝ In the above example, for words that contain more than 3 letters, the first and last letters remain the same while all of the interior letters are transposed in groups of two, ignoring punctuation. If there are an odd number of letters in the interior of the word, then the last letter is left as it is.
⍝ Write a function that takes a character vector word as its argument and returns the word’s letters juxtaposed as described above.
juxtaposeInner ← {∊ ⌽¨ ⍵⊂⍨ 1@(0 (¯1+≢⍵))⊢ 0 1⍴⍨ ≢⍵}

assert 'agrmunet' ≡ juxtaposeInner 'argument'
assert 'tihs' 'is' 'aewosme' ≡ juxtaposeInner¨ 'this' 'is' 'awesome'
⎕ ← '09 ok'