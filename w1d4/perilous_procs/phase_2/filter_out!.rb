# filter_out!
# Rewrite your previous filter_out method to mutate the input array instead of
# returning a new array. That is, write a method filter_out! that accepts an 
# array and a block as args. The method should remove elements of the input array
# that return true when given to the block. Solve this without using
# Array.reject!.

def filter_out!(arr, &proc)
  arr.each.with_index { |el, i| arr[i] = nil if proc.call(el) }
  arr.delete(nil)
end

arr_1 = [10, 6, 3, 2, 5 ]
filter_out!(arr_1) { |x| x.odd? }
p arr_1     # [10, 6, 2]

arr_2 = [1, 7, 3, 5 ]
filter_out!(arr_2) { |x| x.odd? }
p arr_2     # []

arr_3 = [10, 6, 3, 2, 5 ]
filter_out!(arr_3) { |x| x.even? }
p arr_3     # [3, 5]

arr_4 = [1, 7, 3, 5 ]
filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
p arr_4 # [1, 7, 3, 5]