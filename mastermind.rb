
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



class PlayingBoard 
  
  def initialize(code)
    @board = { rows: [] }
    # @codemaker = codemaker
    # @codebreaker = codebreaker
    @CODE = code
  end

  def self.setup_board


    code_in = define_code    
    PlayingBoard.new(code_in)


  end

  def add_row    
    @board[:rows].unshift(Row.make_row(self))
  end


  def self.define_code(_in = nil)
    #take input or run random method
    return code = [:red, :blue, :magenta, :green]
  end

  def generate_random_code

  end

  def give_feedback(guess_in)
    # take guess
    # check against code
    # send guess and result for making a row
    return ["!"]
  end

  def show_game    
    # binding.pry
    out = " -"
    @board[:rows].each_with_index do |board_row, row_n|
      out += "#{row_n}- "
      out += "|  #{board_row.guessing_row.join("  |  ")}  |"
    end
    puts out += " -- "
  end


end

class Row    
  attr_reader :guessing_row, :feedback_row
  
  @@ICON = "@"
  @@GUESS_SET = {
    red: "\e[91;1m#{@@ICON}\e[0m",
    green: "\e[92;1m#{@@ICON}\e[0m",
    blue: "\e[94;1m#{@@ICON}\e[0m",
    yellow: "\e[93;1m#{@@ICON}\e[0m",
    magenta: "\e[95;1m#{@@ICON}\e[0m",
    cyan: "\e[96;1m#{@@ICON}\e[0m"}

  @@FEEDBACK_SET = {
    ye: 
  }


  def initialize(row_in, feed_in)
    @guessing_row = row_in
    @feedback_row = feed_in    
  end

  def self.make_row(board_in)
    guess = breaker_guess
    feedback = board_in.give_feedback(guess)
    Row.new(guess, feedback)
    #take guess and feedback result, make a row instance to add to PlayingBoard.board    
  end


  def self.breaker_guess
    #parse input
    breaker_input = [@@GUESS_SET[:red], @@GUESS_SET[:red],@@GUESS_SET[:red],@@GUESS_SET[:red]]
    #send for feedback    
    return breaker_input
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

# class GameFlow
#   def initialize
#     @PlayingBoard    
#   end
# end

current_game = PlayingBoard.setup_board
current_game.add_row
p current_game
p current_game.show_game


