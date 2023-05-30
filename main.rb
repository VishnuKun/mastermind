# frozen_string_literal: true

require_relative '/module.rb'
require_relative '/players.rb'
class MasterMind
  # initial colors => 'red', 'green', 'yellow', 'blue', 'magenta', 'black'
  @@color_array = %w[red green yellow blue magenta black]
  # store code
  @@code = []
  # mix in
  include MyMethods
  
  # set color code as per user's choice

    # return feedback message
    def feedback_message(guess)
      @feedback = []
      # '🟢' => correct color at correct position
      # '⭕' => correct color at wrong position
      # '⚫' => color not used in code
      @guess_array = guess
      # store matches
      @matched = []
      # iterate through the array and check for matches
      # if an element matches then check for indexes as well
      @guess_array.each_with_index do |guess, _guess_index|
        # push element that matches with any code element
        @matched << if @@code.include?(guess) == true
                      guess
                    else
                      # if not, then push '_' to the feedback
                      '_'
                    end
      end
      # now check if matches were
      unless @matched.all? { |colors| colors == '_' }
        4.times do |i|
          @feedback << if @matched[i] == @@code[i]
                         # if element matches with code's element
                         '🟢'
                       elsif @matched[i] == '_'
                         # if element matches with '_'
                         '⚫'
                       else
                         '⭕'
                       end
        end
      end
      # return the feedback
      @feedback.shuffle
    end
end

game = MasterMind.new
p game.get_guess('Mastermind')
