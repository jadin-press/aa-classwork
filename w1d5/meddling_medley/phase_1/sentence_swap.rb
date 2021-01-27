# Write a method sentence_swap that accepts a sentence and a hash 
# as arguments. The method should return a new sentence where every 
# word is replaced with it's corresponding value 
# in the hash. If a word does not exist as a key of 
# the hash, then it should remain unchanged.

def sentence_swap(sentence, hash)
  output = sentence.split(" ")
  output.each_with_index do |word, idx|
    if hash.has_key?(word)
      output[idx] = hash[word]
    end
  end
  output.join(" ")
end

p sentence_swap('anything you can do I can do', 'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall') 
    # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad', 'cat'=>'dog', 'sad'=>'happy', 'what'=>'make') 
    # 'make a happy ad'

p sentence_swap('keep coding okay', 'coding'=>'running', 'kay'=>'pen') 
    # 'keep running okay'