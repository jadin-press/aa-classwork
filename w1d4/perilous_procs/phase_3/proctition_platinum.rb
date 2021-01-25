# Write a method proctition_platinum that accepts an array and any number of
# additional procs as arguments. The method should return a hash where the keys
# correspond to the number of procs passed in.

# For example, if three procs are passed in, then the hash should have the keys
# 1, 2, and 3.
# The values associated with each key should be an array containing the elements
# of the input array that return true when passed into the corresponding proc.

# For example, this means that the array that corresponds to the key 2 should
# contain the elements that return true when passed into the second proc.
# If an element returns true for multiple procs, then it should only be placed
# into the array that corresponds to the proc that appears first in the arguments.

def proctition_platinum(arr, *procs)
  hash = Hash.new 
  counter = 1
  procs.length.times do
    hash[counter] = arr.select { |el| procs[counter-1].call(el) && !hash.values.flatten.include?(el) }
    counter += 1
  end
  hash
end


is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
begins_w = Proc.new { |s| s.downcase[0] == 'w' }

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)
# {1=>["when!", "WHERE!"], 2=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)
# {1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)
# {1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)
# {1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]}