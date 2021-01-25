# Write a method multi_map that accepts an array, an optional number (n), and a
# block as arguments. The method should return a new array where each element
# of the original array is repeatedly run through the block n times. If the
# number argument is not passed in, then the the elements should be run through
# the block once.

def multi_map(arr, num=1, &proc)
  new_arr = arr.clone
  arr.each_with_index do |el, i|
    num.times { new_arr[i] = proc.call(new_arr[i]) }
  end
  new_arr
end



p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             # [40000, 30000, 20000, 70000]