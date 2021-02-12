require "byebug"

class Board
    attr_accessor :grid
    
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}
    end

    def valid?(position)
        position[0].between?(0, @grid.length - 1) && position[1].between?(0, @grid.length - 1)
    end

    def empty?(position)
        @grid[position[0]][position[1]] == "_"
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            @grid[position[0]][position[1]] = mark
        else
            raise "invalid mark"
        end
    end

    def print
        @grid.each { |row| p row }
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |row| row.all?(mark) }
    end

    def win_diagonal?(mark)
        def check_from_left(mark)
            row, column = 0, 0
            while row <= @grid.length - 1 && column <= @grid.length - 1
                return false if @grid[row][column] != mark
                row += 1
                column +=1
            end
            true
        end
        
        def check_from_right(mark)
            row, column = 0, @grid.length - 1
            while row <= @grid.length - 1 && column >= 0
                return false if @grid[row][column] != mark
                row += 1
                column -=1
            end
            true
        end

        check_from_left(mark) || check_from_right(mark)

    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end
    
    def empty_positions?
        @grid.flatten.include?("_")
    end

    def legal_positions
        legal_array = []
        # debugger
        @grid.each_index do |row|
            @grid[row].each_index do |col|
                legal_array << [row, col] if valid?([row, col]) && empty?([row, col])
            end
        end
        legal_array
    end

end