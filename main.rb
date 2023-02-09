# 2 classes in app 1 = Game (app class)  2 = Player class with 2 instances

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


  
class ComputerPlayer < Player
# ComputerPlayer class inherits from Player
# Define a get_move that over-rides method in parent class
  def get_move
      @move = [:rock, :paper, :scissors].sample
  end
end



class Game
    # WIN_SCENS are for player 1
    WIN_SCENS = [
        [:rock, :scissors],
        [:paper, :rock],
        [:scissors, :paper]
    ]
    
    def initialize
        # @p1 = Player.new
        # @p2 = ComputerPlayer.new
        # play
        @players = []
        @p1 = Player.new("p1")
        @players << @p1
        @p2 = ComputerPlayer.new("p2")
        @players << @p2
        play
        # Move method play into initialize so game automatically starts up
    end
    
      # def pick_winner(moves)
        # if moves[0] == moves[1]
    def pick_winner
        if @p1.move == @p2.move
            puts "It's a tie"
        elsif WIN_SCENS.include?([@p1.move, @p2.move])
        # elsif WIN_SCENS.include?(moves)
            puts "p1 wins"
            @p1.win
            # win is a method on player to increment score
        else
            puts "p2 wins"
            @p2.win
        end
    end
        
    def play_round
         # return false unless @p1.get_move
        # return false unless @p2.get_move
        return false unless @players.all? do |player|
            player.get_move
        end
        print_moves
        pick_winner
        print_scores
        puts
        puts "Let's Play Again"
        true
        # play_round is returning true in play
    end
    
    
    def play
        loop do
            break unless play_round
        end
        puts "Goodbye, thans for playing."
    end
        

    def print_moves
        puts "p1 played #{@p1.move}, p2 played #{@p2.move}."
    end
    
    
    def print_scores
        puts "Scores : "
        @players.each do |player|
            puts "#{player.name} : #{player.score}
        end"
        # puts "p1 : #{@p1.score}"
        # puts "p2 : #{@p2.score}"
        end
    end
   
end

Game.new