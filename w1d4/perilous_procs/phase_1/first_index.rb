# Write a method first_index that accepts an array and a block as arguments.
# The method should return the index of the first element of the array that
# returns true when giben to the block. If no element of returns true, then the
# method should return nil. Solve this using Array#each.

def first_index(arr, &proc)
  arr.each_with_index { |el, i| return i if proc.call(el) }
  nil
end

p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }           # 2
p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 3 } # 0
p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 6 } # nil
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 'b' }            # 0
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.include?('a') }        # 1
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 't' }            # nil