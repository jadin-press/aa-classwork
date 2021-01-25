def is_prime?(num)
  return false if num < 2
  (2...num).each { |n| return false if num % n == 0 }
  true
end

def nth_prime(n)
  counter = 2
  prime_nums = []
  while prime_nums.length < n
    prime_nums << counter if is_prime?(counter)
    counter += 1
  end
  prime_nums.last
end

def prime_range(min, max)
  primes = []
  (min..max).each { |n| primes << n if is_prime?(n) }
  primes
end