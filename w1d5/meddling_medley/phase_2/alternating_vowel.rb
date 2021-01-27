# Write a method alternating_vowel that accepts a sentence as an argument.
# The method should return a new sentence where the words alternate between
# having their first or last vowel removed. For example:

# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on

# Note that words that contain no vowels should remain unchanged.
# Vowels are the letters a, e, i, o, u.

def alternating_vowel(str)
  vowels = "AEIOUaeiou"
  def remove_first(str)
      
    output = ""
    str.each_char.with_index do |char, idx|
      if !vowels.include?(char)
        output += str[idx]
      end
    end
    output
  end
  
  new_string = str.split(" ")
  new_string.each_with_index do |word, idx|
    output = ""
    if idx % 2 == 1
      word = word.reverse
      word.each { |char| output += str[idx] if  }
      if !vowels.include?(char)
        output += str[idx]
      end
      new_string[idx] = remove_first(str.reverse).reverse
    else
        new_string[idx] = remove_first(str)
    end
  end
  new_string.join(" ")
end

#well now it's not changing anything
#OOOOhhhh
# oh wait it's because i got rid of map
# omg why lol
# I think that'll fix it
# this makes no sense why won't it wo
# I do not understand....I think it has to do with the remove_first maybe?

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"