class Board
    WIDTH = 3
    HEIGHT = WIDTH
    
    attr_accessor :grid
    
    def initialize
        @grid = Array.new(HEIGHT) { Array.new(WIDTH,:" ")}
    end
    
    
    # def print_grid
    #     @grid.each do |row|
    #         puts # Like saying print "n\" (new line character)
    #         row.each do |cell|
    #             print "[#{cell}]"
    #         end
    #     end
    #     puts
    # end
    # For an array of strings, puts prints out every member on it's own line
    
    # FIRST REFACTOR - This pattern creates an object, and adds to it by
    # iterating over it (reduce method)
    #  def print_grid
    #      output = [""]     # Variable to hold array want to print
    #     @grid.each do |row|
    #         row_string = ""     #Initialize with empty
    #         row.each do |cell|
    #             row_string << "[#{cell}]"   # Append the cell to this row
    #         end
    #         output << row_string     # Take row just built and append it to output
    #     end
    #     output << ""     # Add an empty line at end / reinitialize output
    # end
    
    # SECOND REFACTOR
    # def print_grid
    #     # Replace call to each with a reduce and add an accumulator value
    #     # to row. Then split off to a seperate function
    #     output=@grid.reduce([""]) do |output_string, row|
    #       output_string << format_row(row)
    #     end
    #     output << ""
    # end
    
    # THIRD REFACTOR - 74 - Refactoring Print Grid
    def print_grid
        @grid.reduce([""]) { |output, row| output << format_row(row ) } << ""
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
    
    private
    def format_row(row)
        row.reduce("") { |row_string, cell| row_string << "[#{cell}]" }
    end
    
#end of class Board
end