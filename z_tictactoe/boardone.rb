class Board
    WIDTH = 3
    HEIGHT = WIDTH
    
    attr_accessor :grid
    
    def initialize
        # @grid = Array.new(3,[:" ",:" ",:" "])
        # @grid = Array.new(3,Array.new(3,:" "))
        # @grid = Array.new(3) { Array.new(3,:" ")}
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
    
# Can't directly iterate over columns so instead iterate over the indexes 
# and use a range object to represent the index numbers 
# Could use (0..2) or (0...3) but instead substitute the WIDTH
    def column_win?(x_or_o)
        (0...WIDTH).any? do |column_index|  
            @grid.all? do |row|
                row[column_index] == x_or_o
            end
# Is it true that for each column and each row that the cell in that 
# column of that row is equal to x_or_o
        end
    end


# One option is to just list the diagonals since there's only 2 of them
# OR @grid[0][0],@grid[1][1],@grid[2][2]
# OR @grid[0][2], #Width = 3 minus 1 minus i = 2
#    @grid[1][1], #Width = 3 minus 1 minus i = 1
#    @grid[2][0]  #Width = 3 minus 1 minus i = 0
# WIDHT is the same as HEIGHT
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
    
    #REFACTOR
    # def diagonal_win?(x_or_o)
    #     [-1, 1].any? do |sign|
    #         (0...WIDTH).all? do |i|
    #             if sign > 0
    #                 second_index = i
    #             else
    #                 second_index = sign * (i+1)
    #             end
    #             @grid[i][second_index] == x_or_o
    #         end
    #     end
    # end
    
    # GETTER METHOD - passes y,x to the array called grid - y accesses an index in the array grid
# and x accesses an index inside one of the 3 internal arrays in grid that's a row.
    # def [](y,x)
    #     @grid[y][x]
    # end
    
    
    # # SETTER METHOD
    # def []=(y,x,something)
    #     if @grid[y][x] != :" " && [:X,:O].include?(something)   
    #         # :" " is the symbol for empty space
    #     @grid[y][x] = something
    #     else
    #         false
    #     end
    # end
    
#end of class Board
end
        
def print_and_check
    @b.print_grid
    # p @b.row_win?(:O)
    # p means print out what row_win method returns
    # Need to make "b" and instance variable in this method and outside it
    puts "Row with all Os?: #{@b.row_win?(:O)}"
    puts "Row with all Xs?: #{@b.row_win?(:X)}"
    puts "Column with all Os?: #{@b.column_win?(:O)}"
    puts "Column with all Xs?: #{@b.column_win?(:X)}"
    puts "Diagonal with all Os?: #{@b.diagonal_win?(:O)}"
    puts "Diagonal with all Xs?: #{@b.diagonal_win?(:X)}"
end



#TESTS
# Board.new.print_grid
@b = Board.new

@b.grid[0][0]=:O
# @b[0,0]=:O
print_and_check

@b.grid[1][1]=:O
# @b[1,1]=:O
print_and_check

@b.grid[2][2]=:O
# @b[2,2]=:O
print_and_check


# There are no columns, just a place inside of a row

# I get three X's instead of one IN THE MIDDLE COLUMN. When you create an array and you tell it, give me three arrays that look like this. It's only going to create the array once.
# And then my new array is going to contain three pointers to that same object. If want to create a different array each time that I populate one of the slots in my grid,
# then I have to pass this as a block instead. ==> # @grid = Array.new(3) { Array.new(3,:" ")}

# In the same way b.grid[0][1].replace("X").downcase would act on all 3 {} in top row 


# FIRST ITERATION    
#     def initialize
#     # 3 arrays with 3 arrays inside each one
#     # Looks like: [[[], [], []], [[], [], []], [[], [], []]]
#         @grid = [
#             [[],[],[]],
#             [[],[],[]],
#             [[],[],[]]
#         ]
#     end
    
#     def print_grid
#         @grid.each do |row|
#             puts
#             row.each do |cell|
#                 print "[ ]"
#             end
#         end
#         puts
#     end
    
# end

# Board.new.print_grid