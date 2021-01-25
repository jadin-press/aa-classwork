# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
require 'pry'

def compress_str(str)
    # binding.pry
    char_array = str.split("")
    new_array = []
    counter = 1
    index = 0
    while index < char_array.length do
        if char_array.length == 1
            letter = char_array[index]
            char_array.shift(counter)
            new_array << letter
            # binding.pry
        elsif char_array[index] == char_array[index + 1]
            counter += 1
            index += 1
            # binding.pry
        else
            letter = char_array[index]
            # binding.pry
            char_array.shift(counter)
            # binding.pry
            if counter == 1
                new_array << letter
                # binding.pry
            else
                new_array << "#{counter}#{letter}"
                # binding.pry
            end
            counter = 1
            index = 0
            # binding.pry
        end
        # binding.pry
    end
    new_array.join("")
end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
