def average(num_1, num_2)
  (num_1 + num_2) / 2.0
end

def average_array(arr)
  arr.sum / arr.length.to_f
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(sentence)
  arr = sentence.split(" ").map.with_index do |ele, i|
    i.odd? ? ele.downcase : ele.upcase
  end
  arr.join(" ")
end