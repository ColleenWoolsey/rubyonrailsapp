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
        @board[1,1] = player.x_or_o
    # Check for a winner
        p @board.winner?(player.x_or_o)
    end
    
    
    def print_board
        @board.print_grid
    end
    
end