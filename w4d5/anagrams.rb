def first_anagram?(string1, string2)
    anagrams = string1.split("").permutation.to_a
    anagrams.include?(string2.split(""))
end
#time complexity = O(n!)


def second_anagram?(string_1, string_2)
  arr = string_2.split("")
  string_1.each_char do |char|
    i = arr.find_index(char)
    arr.delete_at(i) if i != nil
  end
  arr == []
end
# time complexity = O(n^2)

# p second_anagram?("elvis", "lives")
# p second_anagram?("elvis", "ljkjd")

def third_anagram?(string_1, string_2)
  arr_1 = string_1.split("")
  arr_2 = string_2.split("")
  sorted_1 = quick_sort(arr_1)
  sorted_2 = quick_sort(arr_2)
  sorted_1 == sorted_2
end

#n^2 - because both inputs are strings?
#n^2 + m^2
def quick_sort(arr)
  return [] if arr.length == 0
  return arr if arr.length == 1
  pivot = arr[0]
  left = arr[1..-1].select { |el| el < pivot }
  right = arr[1..-1].select { |el| el >= pivot }
  quick_sort(left) + [pivot] + quick_sort(right)
end

# p third_anagram?("elvis", "lives")
# p third_anagram?("elvis", "ljkjd")



def fourth_anagram_b?(string1, string2)
    char_count1 = Hash.new{|h, k| h[k] = 0}
    char_count2 = Hash.new{|h, k| h[k] = 0}
    string1.each_char {|char| char_count1[char] += 1}
    string2.each_char {|char| char_count2[char] += 1}
    char_count1 == char_count2
end

def fourth_anagram?(string1, string2)
    char_count = Hash.new{|h, k| h[k] = 0}
    string1.each_char {|char| char_count[char] += 1}
    string2.each_char {|char| char_count[char] -= 1}
    char_count.values.all?(0)
end

#time complexity = O(n)

p fourth_anagram_b?("elvis", "lives")
p fourth_anagram_b?("elvis", "ljkjd")