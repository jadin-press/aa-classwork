# Write a method triplet_true? that accepts a string as an 
# argument and returns a boolean indicating whether or not the 
# string contains three of the same character consecutively.

def triplet_true(str)
    return false if str.length < 3
    (0...str.length - 2).each do |idx|
        return true if str[idx] == str[idx + 1] && str[idx] == str[idx + 2]
        # str[idx+1..idx+2].all?(str[idx])
    end
    false
end

p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false