require "byebug"
def strange_sums(arr)
    count = 0 

    arr.each_index do |i1|
        arr.each_index do |i2|
            if i1 <= i2 && arr[i1] + arr[i2] == 0
                count += 1
            end
        end
    end

    count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9]) 

def pair_product(array, num)
    array.each_index do |i1|
        array.each_index do |i2|
            if i2 > i1 && array[i1] * array[i2] == num
                return true
            end
        end
    end
    false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str,hash)
    new_arr = []
    str.split("").each do |character|
        if hash.has_key?(character)
            hash[character].times do 
                new_arr << character
            end
        else
            new_arr << character
        end
    end

    new_arr.join("")
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississpi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
    if num == 1
        return true
    end
    (1...num).each do |n|
        if n * n == num
            return true
        end
    end
    false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

# phase2 

def anti_prime?(num)

    num_factors = (1..num).count {|i| num % i == 0}
    # debugger
    (1...num).each do |idx| 
       i_factors = (1..idx).count {|i| idx % i == 0}
    # debugger
       
       if i_factors > num_factors
            return false
       end
    end

    true
end


# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(array1, array2)
    new_array = Array.new(array1.length) {Array.new(array1[0].length,0)}
    array1.each_with_index do |el, i|
        el.each_index do |i2|
        new_array[i][i2] = el[i2] + array2[i][i2]
        end
    end 
    new_array
end
matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums) #[50, 30]
    new_arr = []
    
    factor_arr = []

    nums.each_with_index do |n, idx|
        one_factor_arr = []
        (1..n).each do |n1|
            if n % n1 == 0
                #new_arr[idx] << n1     
                one_factor_arr << n1

            end
        end
        new_arr << one_factor_arr
    end
    
    new_arr[0].each do |factor|
        counter = 1
        (1...new_arr.length).each do |x|
            if new_arr[x].include?(factor)
                counter += 1
            end
        end
        if counter == new_arr.length
            factor_arr << factor
        end
    end
    factor_arr
end

# new_arr = [[5, 10, 25, 50], [1, 2, 3, 5, 6, 10, 15, 30]]
# new_arr [[divisors of 50], [divisors of 30]]

# new_arr.each_with_index do |n1, idx1|
    
#     n1.each_with_index do |n2, idx2|
#         (1..new_arr.length - 1).each do |idx3|
#            if !new_arr[idx3].include?(n2)

#         if idx2 > idx1 

#         end
#     end
# end
# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]
 

# def mutual_factors(*nums)
#     new_array = []
#     new_hash = Hash.new(0)
#     final_array = []

#     nums.each do |number|
#         new_array << find_divisors(number)
#     end

#     new_array.each do |subArray|
#         subArray.each do |num|
#             new_hash[num] += 1
#         end
#     end

#     new_hash.each do |k,v|
#         if new_hash[k] == nums.length
#             final_array << k
#         end
#     end
#     final_array
# end

# #helper method
# def find_divisors(number)
#     (1..number).select {|factor| number % factor == 0}
# end

def tribonacci_number(num)
    sequence = [1, 1, 2]
    if num == 1 || num == 2
        return 1
    elsif num == 3
        return 2
    else
        (3..num-1).each do |i|
            sequence[i] = sequence[i - 1] + sequence[i - 2] + sequence[i - 3]
        end
    end
    sequence[-1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

#Phase 3:

def matrix_addition_reloaded(*arr)
    length = arr[0].length 
    (1..arr.length-1).each do |i|
        if arr[i].length != length
            return nil
        end
    end

    new_array = Array.new(arr[0].length) {Array.new(arr[0][0].length,0)}
    arr[0].each_with_index do |el, i|
        el.each_index do |i2|
            arr.each do |ele|
                new_array[i][i2] += ele[i][i2]
            end
        # new_array[i][i2] = array1[i][i2] + array2[i][i2] + array3[i][i2]
        end
    end 
    new_array
end


# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]
# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr)
    length = arr[0].length
    (0...length).each do |i|
       if arr[i].each 

    end 
end

p squarocol?([
    [:a, :x , :d],    [:x, :x, :x,].dedupe = [:x]   arr[][0]
    [:b, :x , :e],
    [:c, :x , :f],
    #[:a, :b, :c],
    #[:x, :x, :x,],
    #[:d, :e, :f] 
])