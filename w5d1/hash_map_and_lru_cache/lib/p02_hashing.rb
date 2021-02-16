class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0 if self.empty?
    self.map { |num| (num + 1).to_s }.join("").to_i
  end
end

class String
  def hash
    self.split("").map { |char| (char.ord + 1).to_s }.join("").to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    new_arr = []
    self.each { |k, v| new_arr << [k, v] }
    new_arr.sort.map { |pair| p pair.map { |el| el.hash } }.flatten.sum.hash
  end
end
