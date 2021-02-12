# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.empty?
            return nil
        end

        if self.all? {|el| el.is_a?(Integer) || el.is_a?(Float)}
            return self.max - self.min
        end
    end

    def average
         if self.empty?
            return nil
        end

        if self.all? {|el| el.is_a?(Integer) || el.is_a?(Float)}
            return self.sum / self.length.to_f 
        end
    end

    def median
        if self.empty?
            return nil
        end

        sorted = self.sort

        if self.length.odd?
            sorted[self.length/2]
        else
            (sorted[self.length/2.0 ] + sorted[self.length/2.0 - 1]) / 2.0
        end
    end

    def counts
        hash = Hash.new(0)
        self.each_with_index {|el, idx| hash[el]+=1}
        hash
    end
    
    def my_count(n)
        count = 0
        self.each { |element| count +=1 if element == n }
        count
    end

    def my_index(n)
        self.each_with_index do |el, i|
            if el == n
                return i
            end
        end
        return nil
    end

    def my_uniq
        hash = Hash.new(0)
        self.each { |ele| hash[ele] +=1 } 
        hash.keys
    end

    def my_transpose
        transposed = []
        self.each_with_index do |ele1, i1|
            temp = []
            self.each_with_index do |ele2, i2|
                temp << self[i2][i1] 
            end
            transposed << temp
        end
        transposed
    end
    #[
    #[1,2] [0,0][0,1]
    #[1,2] [1,0][1,1]
    #]

     #[
    #[1,1] [0,0][0,1]
    #[2,2] [1,0][1,1]
    #]


end
