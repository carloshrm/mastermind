
# icons(instead of colors) and positions, player guesses and feedback is given, then show feedback
#  a board showing icons for code, find an iconset, needs to be easy to input for player turns (# @ $ % & ~ * x),
# generate an icon set (codemaker, random or player)
# show as |  #  |  @  |  $  |  %  |  for board, ( ? !  ) add rows as the codebreaker plays, number of rounds | make a list that has round info -
#       current row, past rows. each row in the list has info for icons, info for feedback
# feedback shown as ? or ! | a ?? for matching icon, !! for matching both icon and position
# 12 turns until game over
# module for input output? constants for messages + string interpol.

module InputOutput
  def show_board
    puts self.board.to_s
  end
end

class PlayingBoard
  attr_accessor :board
  include InputOutput
  def initialize(codemaker,codebreaker)
    @board = { rows: [""], feedback: [""], code: [""] }
    @codemaker = codemaker
    @codebreaker = codebreaker
  end


end

# class Row  
#   include InputOutput
#   def initialize()
#     @playing_row = ["", "", "", ""]
#     @feedback_row = ["", "", "", ""]
#   end
# end

# class Player
#   def initialize
#     @name = name    
#   end
# end

# class CodeMaker < Player
#   def initialize(code)
#     super
#     @code = code
#   end
# end

# class CodeBreaker < Player
#   def initialize
#     super        
#   end
# end

class GameFlow
  def initialize
    @PlayingBoard    
  end
end



game = PlayingBoard.new("hey", "there")
game.show_board