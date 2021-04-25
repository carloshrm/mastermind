
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


  def make_code(code_in)
    #take input or run random method
    code = [:red, :blue, :magenta, :green]
  end

  def random_code

  end

  def give_feedback
    # take guess
    # check against code
    # send guess and result for making a row
  end

end

class Row    
  
  @@ICON = "@"
  @@COLORS = {
    red: "\e[91;1m#{@@ICON}\e[0m",
    green: "\e[92;1m#{@@ICON}\e[0m",
    blue: "\e[94;1m#{@@ICON}\e[0m",
    blue: "\e[93;1m#{@@ICON}\e[0m",
    magenta: "\e[95;1m#{@@ICON}\e[0m",
    cyan: "\e[96;1m#{@@ICON}\e[0m",}

  def initialize(row_in, feedback_in)
    @playing_row = ["", "", "", ""]
    @feedback_row = ["", "", "", ""]    
    binding.pry
  end

  def make_row(guess, feedback)
    #take guess and feedback result, make a row instance to add to PlayingBoard.board    
  end

  def breaker_guess
    #parse input
    breaker_input = [:red, :red,:red,:red]
    #send for feedback
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

