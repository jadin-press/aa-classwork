# Write a method selected_map! that accepts an array and two procs as arguments.
# The method should replace the elements that return true when passed into the
# first proc with their return values when they are passed into the second proc.
# This method should mutate the input array and return nil.

def selected_map!(arr, proc_1, proc_2)
  arr.each_with_index { |el, i| arr[i] = proc_2.call(el) if proc_1.call(el) }
  nil
end

is_even = Proc.new { |n| n.even? }
is_positive = Proc.new { |n| n > 0 }
square = Proc.new { |n| n * n }
flip_sign = Proc.new { |n| -n }

arr_1 = [8, 5, 10, 4]
p selected_map!(arr_1, is_even, square)     # nil
p arr_1                                     # [64, 5, 100, 16]

arr_2 = [-10, 4, 7, 6, -2, -9]
p selected_map!(arr_2, is_even, flip_sign)  # nil
p arr_2                                     # [10, -4, 7, -6, 2, -9]

arr_3 = [-10, 4, 7, 6, -2, -9]
p selected_map!(arr_3, is_positive, square) # nil
p arr_3                                     # [-10, 16, 49, 36, -2, -9]