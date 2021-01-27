# Write a method hash_mapped that accepts a hash, 
# a proc, and a block. The method should return a new 
# hash where each key is the result of the original key when given
#  to the block. Each value of the new hash should be the result 
#  of the original values when passed into the proc.

def hash_mapped(hash, proc, &blk)
    output = Hash.new(0)
    hash.each { |key, val| output[blk.call(key)] = proc.call(val) }
    output
end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}