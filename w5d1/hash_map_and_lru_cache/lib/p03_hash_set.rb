class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

   def insert(num)
    if !include?(num.hash)
      self[num.hash] << num.hash
      @count += 1
      if count > num_buckets
        resize!
      end
    end
  end

  def remove(num)
    if include?(num)
      self[num.hash].delete(num.hash)
      @count -= 1
    end
  end

  def include?(num)
    self[num.hash].include?(num.hash)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    if @count > num_buckets
      num_buckets.times { @store << [] }
    end
    flattened = @store.flatten.each
    @store.map! {|bucket| []}
    flattened.each {|el| self[el] << el}
  end
end
