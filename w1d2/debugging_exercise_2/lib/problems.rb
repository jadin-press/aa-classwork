# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    def find_divisors(num)
        # 1. make an array with all divisors
        (2..num).select { |n| num % n == 0 }
    end


    
    # 9 => (2..9) => select n if num % n == 0 => 3 => num % 3 == 0 => 3
    # 8 => [2, 4, 8]
    # 15 => [3, 5, 15]

    # 2. take the list of all divisors and make a new list with only prime numbers
    prime_divisors = find_divisors(num).select { |n| find_divisors(n).length == 1 }

    # 3, 5
    # 3. find the max in the 2nd list

    prime_divisors.max
end

def unique_chars?(str)
    hash = Hash.new(0)

    str.each_char do |ch|
      hash[ch] += 1
    end

    hash.values.none? { |value| value > 1 }
end

def dupe_indices(arr)
  hash = Hash.new()
  
  arr.each_with_index do |el, idx|
    if hash[el]
      hash[el] << idx
    else
      hash[el] = [idx]
    end
  end

  hash.each do |key, value|
    if value.length < 2
      hash.delete(key)
    end
  end

  hash
end


def ana_array_helper(arr)
    hash = Hash.new(0)

    arr.each do |el|
      hash[el] += 1
    end

    hash
end

def ana_array(arr_1, arr_2)
    ana_array_helper(arr_1) == ana_array_helper(arr_2)
end

