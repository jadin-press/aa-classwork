def my_reject(arr, &proc)
  new_array = []
  arr.each { |n| new_array << n if !proc.call(n) }
  new_array
end

def my_one?(arr, &proc)
  counter = 0
  arr.each { |n| counter += 1 if proc.call(n) }
  counter == 1
end

def hash_select(hash, &proc)
  new_hash = Hash.new
  hash.each { |k, v| new_hash[k] = v if proc.call(k, v) }
  new_hash
end

def xor_select(arr, proc_1, proc_2)
  arr.select { |el| proc_1.call(el) ^ proc_2.call(el) }
end

def proc_count(val, proc_arr)
  count = 0
  proc_arr.each { |proc| count += 1 if proc.call(val) }
  count
end