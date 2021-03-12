require 'byebug'

def range_rec(start, fin)
  return [] if fin-1 < start
  [start] + range_rec(start+1, fin)
end

def range_iter(start, fin)
  new_arr = []
  i = start
  while fin > i
    new_arr << i
    i += 1
  end
  new_arr
end

# p range_rec(0, 7)
# p range_iter(0, 7)

def exponentiation_1(b, n)
  return 1 if n == 0
  return b if n == 1
  b*exponentiation_1(b, n-1)
end

def exponentiation_2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    exponentiation_2(b, n / 2) * exponentiation_2(b, n / 2)
  else
    exponentiation_2(b, (n - 1) / 2) * exponentiation_2(b, (n - 1) / 2) * b
  end
end
# exp(b, (n - 1) / 2)
# exp(b, (n - 1) / 2) * exp(b, (n - 1) / 2) * b
# 2**3 * 2**3 *2
# (2, 7)
# 2**4
# 2**2 * 2**2
# p exponentiation_1(2, 3)
# p exponentiation_2(2, 3)

def deep_dup(arr)
  return arr if !arr.kind_of?(Array)
  new_arr = []
  arr.each do |ele|
    new_arr << deep_dup(ele)
  end
  new_arr
end

#p deep_dup([1, [2], [3, [4]]])

def fibonacci_rec(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  return [1, 1,2] if n == 3  
  fibonacci_rec(n-2) + [fibonacci_rec(n-1)[-1]] + [fibonacci_rec(n-1)[-2..-1].sum]
end
# W2D4 Recursive Fib Notes
# def fib(n)
#   arr = []
#   return [1] if n == 1
#   return [1, 1] if n == 2
#  arr  + [fib(n - 1) + fib(n - 2)]
#  p fib(4)

def binary_search(arr, target)
  new_arr = arr
  return nil if arr.empty? 
  middle = (arr.length - 1) / 2
  if arr[middle] > target
    binary_search(arr[0...middle], target)
  elsif arr[middle] < target 
    if binary_search(arr[middle+1..-1], target).nil?
      return nil
    else
      binary_search(arr[middle+1..-1], target) + middle + 1
    end  
  elsif target == arr[middle]
    return new_arr.index(arr[middle])
  else
    return nil
  end
end

# p binary_search([1, 2, 3], 1) # => 0
# p binary_search([2, 3, 4, 5], 3) # => 1
# p binary_search([2, 4, 6, 8, 10], 6) # => 2
# p binary_search([1, 3, 4, 5, 9], 5) # => 3
# p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
  return arr if arr.length <= 1
  left_half = arr[0...arr.length/2]
  right_half = arr[arr.length/2..-1]

  left = merge_sort(left_half) 
  right = merge_sort(right_half)
  merge(left, right)
  
end
def merge(left, right) # ([1, 3, 5], [2, 4, 6])
  # debugger
   new_arr = []
  #  (0...left.length).each do |idx|
  while !left.empty? && !right.empty?
      if left[0].nil?
        new_arr << right[0]
      elsif right[0].nil?
        new_arr << left[0]
      end
      if left[0] > right[0]
        new_arr << right.shift        # new_arr << left[idx]
      else
        new_arr << left.shift
        # new_arr << right[idx]
      end

    end
    new_arr + left + right

end

# arr = [3, 5, 1, 9, 2, 8, 6, 7]
# p merge_sort(arr)


def array_subsets(arr)
  return arr if arr.length == 0  || arr.length == 1
  new_arr = []
  new_arr << [arr[0]] + array_subsets(arr[1..-1])
  
  # length = 1
  # new_arr = [[]]
  # while length <= arr.length
  #   arr.each do |el|
  #     new_arr << Array.new(length) { el }
  #   end
  #   length += 1
  # end
end

p array_subsets([]) # => [[]]
p array_subsets([1]) # => [[], [1]]
p array_subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p array_subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]