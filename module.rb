# frozen_string_literal: true

module MyMethods
  # ask the mastermind to set the code for game
  def set_code 
    @code = nil
    while true
      # get the code
      puts "\r"
      print 'Set the code for game, MasterMind : '
      @input = gets.chomp
      # check if the code given is valid or not
      if @input.split.length == 4
        @code = @input
        break
      else
        puts "\r"
        puts 'Invalid code! Only 4 colors are allowed.'
      end
    end
    @code
  end
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
        puts "You've chosen mastermind "
        @flag = true
        @choice = 'mastermind'
      elsif @input.downcase == 'cb'
        puts "You've chosen codebreaker"
        @flag = true
        @choice = 'codebreaker'
      else
        puts "\r"
        puts 'Invalid choice, please try again.'
        @flag = false
      end
    end
    # return player choice
    @choice
  end

  # get random color code for the computer
  def code_generator(color_array)
    @color_array = color_array
    @code = []
    # push 4 random colors into the code
    # from the colors array
    4.times do
      # push 1 random color into the code
      # remove it from the color array as well
      @code << @color_array.delete_at(rand(@color_array.size - 1))
    end
    @code
  end

  # get guess from Human/Computer
  def get_guess(player)
    @turns = 0
    puts 'Make sure the spellings are correct!'
    puts "Available colors are 'red', 'green', 'yellow', 'blue', 'magenta' and 'black'."
    # run loop til all matches are '🟢' or turns are finished
    while true
      # get guess from Player
      print "Enter your guess #{player} : "
      @guess = gets.chomp
      @guess = @guess.split
      # input should only be 4 characters long
      if @guess.length != 4
        puts "\r"
        puts 'Please enter 4 colors only! Please try again.'
      else
        # call feedback method
        @answer = feedback_message(@guess)
        # check if all answers are '🟢' or not
        print 'Feedback Message : '
        puts @answer.join
        if @answer.all? { |answer| answer == '🟢' }
          puts "Correct guess! You won!"
          break
        else
          # show user feedback
          puts 'Wrong guess! Keep trying.'
        end
      end
      @turns += 1
      # break if turns reach max 12
      if @turns == 12
        puts 'Your turns are over! You lost the game. Better luck next time.'
        break
      end
    end
  end

  # when the player wins or loses the game
  def game_over
    puts "\r"
    puts 'Game Over'
    print 'Would you like to play the game again? Type y for yes or n for no : '
    @choice = gets.chomp
    puts "\r"
    if @choice == 'y'
      MasterMind.new
    end
  end
end
