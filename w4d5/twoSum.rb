def bad_two_sum?(arr, num)
    new_arr = []
    (0...arr.length - 1).each do |i|
        (i + 1...arr.length).each do |j|
            new_arr << "panda" if arr[i] + arr[j] == num
        end
    end
    !new_arr.empty?
end

# time complexity = n^2

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, num)
  new_arr = arr.sort
  i1 = 0
  i2 = -1
  count = 0
  while count < arr.length - 1
    sum = new_arr[i2] + new_arr[i1]
    if sum == num
      return true
    elsif sum > num
      i2 -= 1
    else
      i1 += 1
    end
    count += 1
  end
  false
end

#how could we use bsearch?

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, sum)
  hash = Hash.new { |h, k| h[k] = 0 }
  arr.each do |el|
    if hash.has_key?(sum - el)
      return true
    else
      hash[el] = sum - el
    end
  end
  false
end

# time complexity = O(n)

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false