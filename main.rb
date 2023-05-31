# frozen_string_literal: true

require_relative './module.rb'
require_relative './players.rb'
class MasterMind
  include MyMethods

  # initial colors => 'red', 'green', 'yellow', 'blue', 'magenta', 'black'
  @@color_array = %w[red green yellow blue magenta black]
  # store code
  @@code = []
  
  # mix in
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
    if @guess_array 
      @guess_array.each do |guess|
        # push element that matches with any code element
        @matched << if @@code.include?(guess) == true
                      guess
                    else
                      # if not, then push '_' to the feedback
                      '_'
                    end
      end
    end
    # now check if matches were
    unless @matched.all? { |colors| colors == '_' }
      4.times do |i|
        @feedback << if @matched[i - 1] == @@code[i - 1]
                       # if element matches with code's element
                       '🟢'
                     elsif @matched[i -1] == '_'
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
  # initialize 
  def initialize
    @player = self.ask
    # check if player is master mind or codebreaker
    if @player == 'mastermind' 
      self.set_code
      # make the computer give suggestions
    else
      # generate the random code
      @@code = self.code_generator(@@color_array)
      @guess = self.get_guess(@player)
      self.feedback_message(@guess)
      if @guess == 'Correct guess! You won!'
        puts 'working'
      end
    end
  end

end

game = MasterMind.new

