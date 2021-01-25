# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

# check if the first index is larger than the second index
# if it is, swap them and set sorted variable = false
# if it's not, 

def bubble_sort(array)
    sorted = false
    while !sorted
        sorted = true
        (0...array.length - 1).each { |i| 
            if array[i] > array[i + 1]
                array[i], array[i + 1] = array[i + 1], array[i]
                sorted = false
            end
        }
    end
    array
end

p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]