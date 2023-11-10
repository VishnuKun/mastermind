# frozen_string_literal: true

require_relative './module'
class MasterMind
  include MyMethods

  # initial colors => 'red', 'green', 'yellow', 'blue', 'magenta', 'black'
  @@color_array = %w[red green yellow blue magenta black]
  # store code
  @@code = []

  # mix in
  # return feedback message
  def feedback_message(guess)
    @guess = guess
    @feedback = []
    # '🟢' => correct color at correct position
    # '⭕' => correct color at wrong position
    # '⚫' => color not used in code
    # store matches
    @matched = []
    # iterate through the array and check for matches
    # if an element matches then check for indexes as well
    @guess.each do |color|
      # push element that matches with any code element
      @matched << if @@code.include?(color)
                    color
                  else
                    # if not, then push '_' to the feedback
                    '_'
                  end
    end
    # now check if matches were
    4.times do |i|
      @feedback << if @matched[i - 1] == @@code[i - 1]
                     # if element matches with code's element
                     '🟢'
                   elsif @matched[i - 1] == '_'
                     # if element matches with '_'
                     '⚫'
                   else
                     '⭕'
                   end
    end
    # return the feedback
    @feedback.shuffle
  end

  # initialize
  def initialize
    @player = ask
    # check if player is master mind or codebreaker
    if @player == 'mastermind'
      @@code = set_code
      get_guess('Computer')
      @guess = give_code
    else
      # generate the random code
      # set the code
      @@code = code_generator(@@color_array)
      # guess the code
      @guess = get_guess('Human')
      # display feedback
    end
    feedback_message(@guess)
    game_over
  end
end

MasterMind.new
