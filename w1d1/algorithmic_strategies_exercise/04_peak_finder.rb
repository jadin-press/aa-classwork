# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.
require 'pry'

def peak_finder(arr)
    # binding.pry
    peaks = []
    # binding.pry
    if arr.length >= 3
        (1...arr.length - 1).each { |i| 
            if arr[i - 1] < arr[i] && arr[i] > arr[i + 1]
                peaks << arr[i]
            end
        }
        # binding.pry
        peaks.unshift(arr[0]) if arr[0] > arr[1]
        # binding.pry
        peaks << arr[-1] if arr[-1] > arr[-2]
        # binding.pry
    elsif arr.length == 2 && arr[0] != arr[1]
        peaks << arr.max
        # binding.pry
    end
    peaks
    # binding.pry
end


p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]
