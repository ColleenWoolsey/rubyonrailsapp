class Player
    MOVES = [:rock, :paper, :scissors]
    
    attr_reader :score, :move, :name
    
    def initialize(name)
        @name = name
        @score = 0
        @move = nil
    end
    
    def get_move
        loop do
        # Loop continues until get a valid move or quit
            puts "Pick a move."
            print "> "
            @move = gets.chomp.strip.downcase.to_sym
            if @move == :quit
                return false
            elsif MOVES.include?(@move)
                return @move
            else
                puts "Invalid Move"
            end    
        end
    end
    
    def win
        @score += 1
    end
    
end
