# Write a method picky_procipher that accepts a sentence and a hash as arguments. 
# The hash contains procs as both keys and values. The method should return a new 
# sentence where each word of the input sentence is changed by a value proc if the 
# original word returns true when passed into the key proc. If an original word returns 
# true for multiple key procs, then only the value proc that appears earliest in the hash 
# should be applied.

def picky_procipher(sent, hash)
    new_sent = []
    found = false
    sent.split(" ").each do |word|
        hash.each do |k, v|
            found = false
            if k.call(word)
                new_sent << v.call(word)
                found = true
                break 
            end
        end
        new_sent << word if !found
    end
    new_sent.join(" ")
end


is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
make_question = Proc.new { |s| s + '???' }
reverse = Proc.new { |s| s.reverse }
add_smile = Proc.new { |s| s + ':)' }

p picky_procipher('he said what!',
    is_yelled => make_question,
    contains_a => reverse
) # "he dias what!???"

p picky_procipher('he said what!',
    contains_a => reverse,
    is_yelled => make_question
) # "he dias !tahw"

p picky_procipher('he said what!',
    contains_a => reverse,
    is_yelled => add_smile
) # "he dias !tahw"

p picky_procipher('stop that taxi now',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "stop that??? taxi??? now"

p picky_procipher('STOP that taxi!',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "STOP:) that??? !ixat"