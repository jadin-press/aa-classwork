# Write a method energetic_encoding that accepts a string and a hash as arguments.
# The method should return a new string where characters of the original string
# are replaced with the corresponding values in the hash. If a character is not
# a key of the hash, then it should be replaced with a question mark ('?').
# Space characters (' ') should remain unchanged.

def energetic_encoding(str, hash)
  output = ""
  str.each_char do |char|
    if hash.has_key?(char)
      output += hash[char]
    elsif char != " "
      output += "?"
    else
      output += char
    end
  end
  output
end


p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'