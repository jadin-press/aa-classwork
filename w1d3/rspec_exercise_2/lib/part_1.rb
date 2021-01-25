def partition(arr, n)
  [arr.select { |el| el < n }, arr.select { |el| el >= n }]
end

def merge(hash_1, hash_2)
  hash = hash_1.dup
  hash_2.each { |key, value| hash[key] = value }
  hash
end

def censor_helper(word)
  vowels = "aeiou"
  word.each_char.with_index do |ch, idx|
    word[idx] = "*" if vowels.include?(ch.downcase)
  end
  word
end

def censor(str, words)
  arr = str.split(" ")
  
  new_arr = arr.map.with_index do |word, idx|
    words.include?(word.downcase) ? censor_helper(word) : word
  end
  
  new_arr.join(" ")
end

def power_of_two?(num)
  log = Math.log2(num)
  log == log.to_i
end

