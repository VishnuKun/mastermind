# frozen_string_literal: true

class MasterMind
  def guess; end
  # initial colors => 'red', 'green', 'yellow', 'blue', 'magenta', 'black'
  @@color_array = %w[red green yellow blue magenta black]
  # store code
  @@code = ['red', 'green', 'yellow', 'blue'] # values added for temporary purposes 
  # end game on turn exceeding maximum 12
  # ask user to be creator of code or guesser
  def ask
    # flag for ending loop
    @flag = false
    # store user choice
    @choice = nil
    # keep asking until user gives correct answer
    while @flag == false
      # display statements
      puts "\r"
      puts 'Would you like to play as Master Mind or Code Breaker?'
      print 'Type MM to play as Master Mind or type CB to play as Code Breaker : '
      # get user input
      @input = gets.chomp
      # display chosen choice
      puts "\r"
      if @input.downcase == 'mm'
        puts "You'll be playing as MasterMind"
        @flag = true
        @choice = 'mastermind'
      elsif @input.downcase == 'cb'
        puts "You' be playing as CodeBreaker"
        @flag = true
        @choice = 'codebreaker'
      else
        puts "\r"
        puts 'Invalid choice, please try again.'
        @flag = false
      end
    end
    p @choice
  end

  # get random color code for the computer
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
  def get_guess; end

  # return feedback message
  def feedback_message(guess)
    @feedback = []
    # '⭕' => correct color at correct position
    # '❌' => correct color at wrong position
    # ' ' => color not used in code
    @guess_array = guess
    # store matches 
    @matched = []    
    # iterate through the array and check for matches
    # if an element matches then check for indexes as well
    @guess_array.each_with_index do |guess, guess_index|
      # push element that matches with any code element 
      if @@code.include?(guess) == true
        @matched << guess
      else
        # if not, then push '_' to the feedback
        @matched << '_'
      end
    end
    # now check if matches were 
    if !@matched.all? { |colors| colors == '_' }
      4.times do |i|
        if @matched[i] == @@code[i]
          # if element matches with code's element
          @feedback << '⭕'
        elsif @matched[i] == '_'
          # if element matches with '_'
          @feedback << ' '
        else
          @feedback << '❌'
        end
      end
    end
    # return the feedback
    @feedback.shuffle
  end
end

game = MasterMind.new
# given in code : ['red', 'green', 'yellow', 'blue']
puts game.feedback_message(['red', 'white', 'green', 'blue'])
