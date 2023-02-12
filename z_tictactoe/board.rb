class Board
    WIDTH = 3
    HEIGHT = WIDTH
    
    attr_accessor :grid
    
    def initialize
        @grid = Array.new(HEIGHT) { Array.new(WIDTH,:" ")}
    end
    
    
    def print_grid
        @grid.each do |row|
            puts
            row.each do |cell|
                print "[#{cell}]"
            end
        end
        puts
    end
    
    
    def row_win?(x_or_o)
        @grid.any? do |row|
            row.all? do |cell|
                cell == x_or_o
            end
        end
    end
    

    def column_win?(x_or_o)
        (0...WIDTH).any? do |column_index|  
            @grid.all? do |row|
                row[column_index] == x_or_o
            end
        end
    end


    def diagonal_win?(x_or_o)
        # while i < 3
        return true if (0...WIDTH).all? do |i|
            @grid[i][i] == x_or_o
        end
        return true if (0...HEIGHT).all? do |i|
            @grid[i][WIDTH-1-i] == x_or_o
        end
        false
    end
    
   
    #Method that calls all 3 win methods  -  "||" means OR
    # Will return true as long as any one of these is true
    def winner?(x_or_o)
       row_win?(x_or_o) || column_win?(x_or_o) || diagonal_win?(x_or_o)
    end
    
    
    # GETTER METHOD
    def [](y,x)
        @grid[y][x]
    end
    
    
    # # SETTER METHOD
    def []=(y,x,x_or_o)
        if @grid[y][x] == :" " && [:X,:O].include?(x_or_o)   
            # :" " is the symbol for empty space
        @grid[y][x] = x_or_o
        else
            false
        end
    end
    
#end of class Board
end