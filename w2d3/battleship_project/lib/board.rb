require "byebug"
class Board
    attr_reader :size, :grid

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](position)
        @grid[position[0]][position[1]]
    end
    
    def []=(position, value)
        @grid[position[0]][position[1]]= value
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[position]= :X
            return false
        end
    end

    def place_random_ships
        arr = []
        (0...@grid.length).each do |first_i|
            (0...@grid.length).each do |second_i|
                arr << [first_i, second_i]
            end
        end
        quarter = arr.sample(@size/4) 
        quarter.each do |position|
            self[position] = :S 
        end
    end

    def hidden_ships_grid
        hidden_grid = []
        @grid.each.with_index do |arr, i1|
            hidden_subArr = []
            arr.each.with_index do |ele, i2|
                if ele == :S 
                    hidden_subArr << :N 
                else
                    hidden_subArr << ele 
                end
            end
            hidden_grid << hidden_subArr
        end
        hidden_grid
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts "#{row.join(" ")}"
        end         
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
