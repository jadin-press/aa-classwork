def element_count(arr)
  new_hash = Hash.new(0)
  arr.each { |el| new_hash[el] += 1 }
  new_hash
end

def char_replace!(str, hash)
  str.each_char.with_index { |c, i| hash[c].nil? ? str[i] = c : str[i] = hash[c] }
end

def product_inject(nums)
  nums.inject { |product, el| product * el }
end