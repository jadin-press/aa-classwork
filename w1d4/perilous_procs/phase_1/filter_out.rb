# Write a method filter_out that accepts an array and a block as arguments.
# The method should return a new array where elements of the original array are
# removed if they return true when given to the block. Solve this using
# Array#each.

def filter_out(arr, &proc)
  new_arr = []
  arr.each { |el| new_arr << el if !proc.call(el) }
  new_arr
end


p filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }      # [10, 6, 2]
p filter_out([1, 7, 3, 5 ]) { |x| x.odd? }          # []
p filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }     # [3, 5]
p filter_out([1, 7, 3, 5 ]) { |x| x.even? }         # [1, 7, 3, 5]