def reverser(str, &prc)
  reversed_string = str.reverse
  # reversed_string.each_char.with_index do |ch, idx|
  #   reversed_string[idx] = prc.call(ch)
  # end
  prc.call(reversed_string)
end

def word_changer(str, &prc)
  arr = str.split(" ")
  new_arr = arr.map { |word| prc.call(word) }
  new_arr.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
  [prc_1.call(num), prc_2.call(num)].max
end

def and_selector(arr, prc_1, prc_2)
  arr.select { |el| prc_1.call(el) && prc_2.call(el) }
end

def alternating_mapper(arr, prc_1, prc_2)
  arr.map.with_index { |el, idx| idx.even? ? prc_1.call(el) : prc_2.call(el) }
end

