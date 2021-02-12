def first_anagram(string1, string2)
    anagrams = string1.split("").permutation.to_a
    anagrams.include?(string2.split(""))
end
#time complexity = O(n!)

# p first_anagram("elvis", "lives")
# p first_anagram("elvis", "ljkjd")