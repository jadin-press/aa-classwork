def hipsterfy(word)
    # first define all the vowels
    vowels = 'aeiou'

    # take word and reverse, then iterate
    reversed_word = word.reverse
    
    (0...word.length).each do |idx|
        # the very first time coming a letter in vowel, delete
        if vowels.include?(reversed_word[idx])
            reversed_word[idx] = ''
            return reversed_word.reverse
        end
    end

    word
end

def vowel_counts(str)
    vowels = 'aeiou'
    hash = Hash.new(){ 0 } 
    # numbers including integers and floats are not mutable

    # loop through
    str.each_char do |el|
        # make sure it is within the list of vowels
        if vowels.include?(el.downcase)
            # for every string we look at, plus one to hash[xxx]
            hash[el.downcase] += 1
        end
    end

    hash
end

def caesar_cipher(str, n)
  # create an alphabet
  alphabet = ('a'..'z').to_a
  str.each_char.with_index do |ch, idx|
    alphabet_idx = alphabet.index(ch)
    str[idx] = alphabet[(alphabet_idx + n) % 26] if alphabet.include?(ch)
  end
  str
end