def proper_factors(num)
  (1...num).select { |n| num % n == 0 }
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  num == aliquot_sum(num)
end

def ideal_numbers(num)
  perf_nums = []
  n = 2
  while perf_nums.length < num
    perf_nums << n if perfect_number?(n)
    n += 1
  end
  perf_nums
end