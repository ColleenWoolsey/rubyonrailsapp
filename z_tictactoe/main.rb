require_relative 'game'
require_relative 'player'

puts players = [
    Player.new("Joe", :O),
    Player.new("Moe", :X)
]

p game = Game.new(players)

puts
puts
puts "Welcome to tic tac toe!"
game.print_board
puts
puts "Player One, you go first. Pick a move"
p game.play_turn(players[0])
game.print_board


# On Game class, create a method to get the player's move,
# and mark their place on the board and then check for a winner
# play_turn(player)

# Get a move from player One

# Mark that move on the board

# Check for a winner by first passing in a marker check, 
# and only run checks for themarker we know might have won
# @board.winner?(marker) - This will happen in the game class
# because that's where have access to the Board

