def palindrome?(str)
    str == str.reverse
end

def substrings(str)
    new_arr = []

    str.each_char.with_index do |ch_1, idx_1|
        str.each_index do |ch_2, idx_2|
            new_arr << str[idx_1..idx_2] if idx_2 >= idx_1
        end
    end

    new_arr
end

def palindrome_substrings()
end