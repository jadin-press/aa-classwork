require 'byebug'

def zip(*arr)
  arr.transpose
end

def prizz_proc(arr, prc_1, prc_2)
  arr.select { |el| prc_1.call(el) ^ prc_2.call(el) }
end

def zany_zip(*arrays)
  arr_lengths = arrays.map { |array| array.length }
  max_length = arr_lengths.max
  output = Array.new(max_length) { Array.new(arrays.length) { nil } }
  (0...arrays.length).each do |idx|
    (0...arrays[idx].length).each do |i|
      output[i][idx] = arrays[idx][i]
    end
  end
  return output
end

def maximum(arr, &prc)
  return nil if arr.length == 0  
  max = prc.call(arr[0])
  output = arr[0]
  arr.each do |el|
    if max <= prc.call(el)
      max = prc.call(el)
      output = el
    end
  end
  output
end

def my_group_by(arr, &proc)
  hash = Hash.new(0)
  arr.each do |el|
    if !hash.has_key?(proc.call(el))
      hash[proc.call(el)] = [el]
    else
      hash[proc.call(el)] << el
    end
  end
  hash
end

def max_tie_breaker(arr, proc, &blk)
  return nil if arr.length == 0
  idx_max = 0
  # debugger
  (0...arr.length).each do |idx|
    if blk.call(arr[idx]) > blk.call(arr[idx_max])
      idx_max = idx
    elsif blk.call(arr[idx]) == blk.call(arr[idx_max]) 
      if proc.call(arr[idx]) > proc.call(arr[idx_max])
        idx_max = idx
      elsif proc.call(arr[idx]) == proc.call(arr[idx_max])
        idx_max = idx if idx < idx_max
      end
    end
  end
  arr[idx_max]
end

def silly_syllables(str)
  vowels = "aeiouAEIOU"
  str_arr = str.split(" ")
  output = []
  str_arr.map do |word|
    if word.split("").count { |char| vowels.include?(char)}  < 2
      output << word
    else
      word.each_char.with_index do |char, idx|
        if vowels.include?(char)
          word = word[idx..-1].reverse
          word.each_char.with_index do |char_2, idx_2|
            if vowels.include?(char_2)
              word = word[idx_2..-1].reverse
              output << word
              break
            end
          end
          break
        end
      end
    end
  end
  output.join(" ")
end

# array_1= ['potato', 'swimming', 'cat']
# array_2= ['cat', 'bootcamp', 'swimming', 'ooooo']
# array_3= ['photo','bottle', 'bother']
# length= Proc.new { |s| s.length }
# o_count= Proc.new { |s| s.count('o') }

# p max_tie_breaker(array_1, o_count, &length)


