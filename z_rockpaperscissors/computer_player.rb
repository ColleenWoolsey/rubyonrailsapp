class ComputerPlayer < Player
# ComputerPlayer class inherits from Player
# Define a get_move that over-rides method in parent class
  def get_move
      @move = [:rock, :paper, :scissors].sample
  end
end