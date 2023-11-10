# frozen_string_literal: true

require_relative './module'
# MasterMind
class MasterMind
  include MyMethods

  # initial colors => 'red', 'green', 'yellow', 'blue', 'magenta', 'black'
  @@color_array = %w[red green yellow blue magenta black]
  @@code = []

  # return feedback message
  def feedback_message(guess)
    @guess = guess
    @feedback = []
    # '🟢' => correct color at correct position
    # '⭕' => correct color at wrong position
    # '⚫' => color not used in code
    @matched = []
    @guess.each do |color|
      @matched << if @@code.include?(color)
                    color
                  else
                    '_'
                  end
    end
    4.times do |i|
      @feedback << if @matched[i - 1] == @@code[i - 1]
                     '🟢'
                   elsif @matched[i - 1] == '_'
                     '⚫'
                   else
                     '⭕'
                   end
    end
    @feedback.shuffle
  end

  # initialize
  def initialize
    @player = ask
    if @player == 'mastermind'
      @@code = set_code
      get_guess('Computer')
      @guess = give_code
    else
      @@code = code_generator(@@color_array)
      @guess = get_guess('Human')
    end
    feedback_message(@guess)
    game_over
  end
end

MasterMind.new
