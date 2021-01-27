# Write a method uncompress that accepts a string as 
# an argument. The string will be formatted so every letter 
# is followed by a number. The method should return an "uncompressed" 
# version of the string where every letter is repeated multiple 
# times given based on the number that appears directly after the letter.

def uncompress(str)
  output = ""
  (0...str.length).step(2).each do |idx|
    str[idx+1].to_i.times { output += str[idx] }
  end
  output
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'