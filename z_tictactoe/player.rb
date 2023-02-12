class Player
    
    attr_reader :x_or_o
    
    def initialize(name, x_or_o)
        @name = name
        @x_or_o = x_or_o
        @score = 0
    end
    
    
    def get_move
       [get_row,get_column] 
    end
    
    
    def get_row
        gets.to_i
    end
    
    
    def get_column
        gets.to_i
    end
    
end