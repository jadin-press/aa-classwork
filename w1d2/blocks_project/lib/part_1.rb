def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject() { |el| el["age"] <= 2 }
end

def count_positive_subarrays(arr_2d)
  arr_2d.count() { |subarr| subarr.sum > 0 }
end

def aba_translate(str)
  vowels = "aeiou"
  
  arr = str.split("")
  
  arr.each_with_index do |ch, idx|
    arr[idx] = vowels.include?(ch) ? ch + "b" + ch : ch
    #str.insert(idx + 1, "b" + ch) if vowels.include?(ch)
  end

  arr.join("")
  #str
end

def aba_array(arr)
  arr.map() { |word| aba_translate(word) }
end

