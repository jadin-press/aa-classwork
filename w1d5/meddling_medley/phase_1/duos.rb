# Write a method duos that accepts a string as an argument and returns the 
# count of the number of times the same character 
# appears consecutively in the given string.

def duos(str)
    count = 0
    (0...str.length - 1).each do |idx|
        if str[idx] == str[idx + 1]
            count += 1
        end
    end
    count
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')  