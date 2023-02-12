require_relative 'board'

class Game
    
    def initialize(players)   
    # Initialize with an array of players and then
    # save it interbnally to an array of players
        @players = players
    # New game starts with a new board instance
        @board = Board.new
    end
    
    def play_turn(player)
    # Get a move from player One
        move = player.get_move
    # Mark that move on the board
        # @board[1,1] = player.x_or_o Using [1,1] to test
        #Below is the same as above
        # @baord.[]=(1,1,player.x_or_o)
        # @baord.[]=(move[0],move[1],player.x_or_o)
        # Or can use the splat operator which is thelittle star 
        # to convert arrays into argument
        # @board. []=(*move,player.x_or_o) [*move] becomes a list of arguments 
        # instead of an array
        #     METHOD(*[1,2,3]) is the same as METHOD(1,2,3)
        @board[*move]=(player.x_or_o)
    # Check for a winner
        p @board.winner?(player.x_or_o)
    end
    
    
    def print_board
        @board.print_grid
    end
    
end