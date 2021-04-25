
require 'io/console'
require 'pry'

# colors and positions, player guesses and feedback is given, then show feedback
#  a board showing icons for code, needs to be easy to input for player turns (# @ $ % & ~ * x)...ask for a number instead
# show as |  @  |   for board, ( ? !  ) add rows as the codebreaker plays, number of rounds | make a list that has round info -
#       current row, past rows. each row in the list has info for icons, info for feedback
# feedback shown as ? or ! | a ?? for matching icon, !! for matching both icon and position
# 12 turns until game over
# module for input output? constants for messages + string interpol.
# colorizing the console with constants - , display list, ask player "choose color for pos 1, then 2, then 3, then 4"

# module InputOutput
#   def show_board
    
#   end
# end

class PlayingBoard 
  def initialize(codemaker,codebreaker, code)
    @board = { rows: [""] }
    @codemaker = codemaker
    @codebreaker = codebreaker
    @CODE = code
  end

  def add_row(input)
    @board[:rows] = input
  end

end

class Row    
  
  @@ICON = "#"
  @@COLORS = {red: "\e[31m#{@@ICON}\e[0m", }
  def initialize(row_in, feedback_in)
    @playing_row = ["", "", "", ""]
    @feedback_row = ["", "", "", ""]    
    binding.pry
  end

  def make_row
    @breaker_input = [:red, :red,:red,:red]


  end
  def make_code

  end
end

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

test = Row.new
puts test

