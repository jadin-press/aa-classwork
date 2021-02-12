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
# tally = 35
# other_tally = -5

# def v2(list)
#   tally = 0
#   other_tally = 0
#   list.each do |el|
#     if other_tally > tally
#         tally = other_tally
#         other_tally = 0
#     end
#     if other_tally == 0
#         if el > 0
#             tally += el
#         else
#             other_tally += el
#         end
#     else
#         if el >= 0
#             other_tally += el
#         end
#     end
#   end

# end

# number 1 - if other > tally, tally = other, other = 0
# number 2 - if el is negative, add it to other.
# if other is negative and el is positive, and abs(other) < tally, add other to tally, add el to tally <=====?
# if other is negative and el is positive, and abs(other) > tally, other = 0 + el
# if other is 0 and el is positive, add it to tally


def v2(list)
    tally = list[0]
    other_tally = 0
    list.each do |el|
        if other_tally + el >= 0
            other_tally += el
        else
            other_tally = 0
        end
        if tally < other_tally
            tally = other_tally
        end
    end
    tally
end

list = [2, 3, -6, 7, -6, 7]
p v2(list)

list2 = [5, 3, -7]
p v2(list2)

#time complexity = O(n)