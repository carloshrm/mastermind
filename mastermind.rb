
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
    code = [1, 2, 0, 5]
    return Row.map_icons(code)
  end

  def generate_random_code

  end

  def give_feedback(guess_in)
    # take guess
    # check against code
    # send guess and result for making a row
    return [1,0]
  end

  def show_game    
    # binding.pry
    out = " == "
    @board[:rows].each_with_index do |board_row, row_n|
      out += "#{row_n} - "
      out += "|  #{board_row.guessing_row.join(" | ")}  |  "      
      out += "( #{board_row.feedback_row.join(":")} )"
    end
    puts out += " =="
  end


end

class Row    
  attr_reader :guessing_row, :feedback_row
  
  @@ICON = ["@", "!", "?"]
  @@GUESS_SET = {
    red:   "\e[30;41;1m  #{@@ICON[0]}  \e[0m",
    green: "\e[30;42;1m  #{@@ICON[0]}  \e[0m",
    cyan:  "\e[30;44;1m  #{@@ICON[0]}  \e[0m",
    yellow:"\e[30;43;1m  #{@@ICON[0]}  \e[0m",
    magenta: "\e[30;45;1m  #{@@ICON[0]}  \e[0m",
    white:  "\e[30;47;1m  #{@@ICON[0]}  \e[0m"}

  @@FEEDBACK_SET = {
    half: "\e[33;1m#{@@ICON[1]}\e[0m",
    whole: "\e[33;1m#{@@ICON[2]}\e[0m",
  }


  def initialize(row_in, feed_in)
    @guessing_row = row_in
    @feedback_row = feed_in    
  end

  def self.make_row(board_in)
    guess = Row.map_icons(breaker_guess)
    feedback = Row.map_icons(board_in.give_feedback(guess), 0)
    Row.new(guess, feedback)
    #take guess and feedback result, make a row instance to add to PlayingBoard.board    
  end

  
  
  def self.breaker_guess    
    temp_in = []
    while temp_in.length < 4
      digit = $stdin.getch      
      case
      when digit == "\u007F"
        temp_in.pop if temp_in.length >= 1   
      when (0..5).include?(digit.to_i)
        p digit.to_i
        temp_in.push(digit.to_i)
      end 
    end    
    Row.map_icons(temp_in)
    
    
    breaker_input = [0,4,3,5]
    #send for feedback    
    return breaker_input
  end



  
  def self.map_icons(values, set = 1)
    set == 1 ? set = @@GUESS_SET : set = @@FEEDBACK_SET
    return values.map { |x| set.values[x] }
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
p current_game.show_game


