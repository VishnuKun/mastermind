# frozen_string_literal: true

class MasterMind
  def guess; end
  # initial colors => 'red', 'green', 'yellow', 'blue', 'magenta', 'black'
  @@color_array = %w[red green yellow blue magenta black]

  # codes => random 4 from colors
  # '⭕' => correct color at correct position
  # '❌' => correct color at wrong position
  # end game on turn exceeding maximum 12
  # ask user to be creator of code or guesser
  # get random color code
  def code_generator
    @code = []
    # push 4 random colors into the code
    # from the colors array
    4.times do
      # push 1 random color into the code
      # remove it from the color array as well
      @code << @@color_array.delete_at(rand(@@color_array.size - 1))
    end
    @code
  end

  # get guess from Human/Computer
  # return feedback message
end

x = MasterMind.new
x.code_generator
