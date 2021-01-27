# Write a method compress that accepts a string as an argument. The method should return a "compressed" version of the string where streaks of consecutive letters are translated to a single appearance of the letter followed by the number of times it appears in the streak. If a letter does not form a streak (meaning that it appears alone), then do not add a number after it.

def compress(str)
  count = 1
  output = []
  str.split("").each_with_index do |el, idx|
    while idx < str.length
      if str[idx + 1] == el
        count += 1
      else
        output += [el, count.to_s]
        count = 1
      end
    end
  end
  output.join("")

end

# Examples

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"