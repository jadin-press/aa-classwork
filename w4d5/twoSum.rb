def bad_two_sum?(arr, num)
    new_arr = []
    (0...arr.length - 1).each do |i|
        (i + 1...arr.length).each do |j|
            new_arr << "panda" if arr[i] + arr[j] == num
        end
    end
    !new_arr.empty?
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false