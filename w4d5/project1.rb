def my_min(list)
    min = nil
    list.each do |el1|
        min = el1 if list.count{|el2| el1 <= el2 } == list.length       
    end
    min
end
#time complexity - O(n^2)


def my_min2(list)
    list.inject{|acc, el| acc > el ? el : acc }
end
#time complexity - O(n)

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p my_min2(list)

def largest_contiguous_subsum(list)
  subsets = []
  list.each_with_index do |el1, i1| #n
    list.each_with_index do |el2, i2| #n
      if i2 >= i1
        subsets << list[i1..i2]
      end
    end
  end
  max = subsets[0].sum
  subsets.each do |arr|
    sum = arr.sum
    max = sum if sum > max
  end
  max
end

# time complexity == O(n^2 * nlog(n))

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list)

# [5, 6, 1, -3, -2, 5, 2, 4]
# var_1 = 5 --> 11 --> 12 --> 7
# var_2 = -3 --> -5

def method_name
  
end