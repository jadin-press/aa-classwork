# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num1, num2)
    
    num1_factors = (1..num1 / 2).select { |num| num1 % num == 0 }
    num2_factors = (1..num2 / 2).select { |num| num2 % num == 0 }
    common_factors = num1_factors.select { |num| num2_factors.include?(num) }
    common_factors.length == 1

end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false

