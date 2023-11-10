# frozen_string_literal: true

# contains methods for mastermind
module MyMethods
  # ask the mastermind to set the code for game
  def set_code
    @code = nil
    loop do
      puts "\r"
      print 'Set the code for game, MasterMind : '
      @input = gets.chomp
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
    @flag = false
    @choice = nil
    while @flag == false
      puts "\r"
      puts 'Would you like to play as Master Mind or Code Breaker?'
      print 'Type MM to play as Master Mind or type CB to play as Code Breaker : '
      @input = gets.chomp
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
    @choice
  end

  # get random color code for the computer
  def code_generator(color_array)
    @color_array = color_array
    @code = []
    4.times do
      @code << @color_array.delete_at(rand(@color_array.size - 1))
    end
    @code
  end

  # get codes for computer based on some strategy
  def give_code
    @code = code_generator(%w[red green yellow blue magenta black])
    @code
  end

  # get guess from Human/Computer
  def get_guess(user)
    @turns = 0
    puts 'Make sure the spellings are correct!'
    puts "Available colors are 'red', 'green', 'yellow', 'blue', 'magenta' and 'black'."
    loop do
      print "Enter your guess #{user} : "
      if user == 'Computer'
        @guess = give_code
        print @guess.join(' ')
        puts "\r"

      elsif user == 'Player'
        @guess = gets.chomp.split
        print @guess.join(' ')
      else
        @guess = gets.chomp.split
        print @guess.join(' ')
      end
      if @guess.length != 4
        puts "\r"
        puts 'Please enter 4 colors only! Please try again.'
      else
        @answer = feedback_message(@guess)
        print 'Feedback Message : '
        puts @answer.join
        if @answer.all? { |answer| answer == '🟢' }
          puts 'Correct guess! You won!'
          break
        else
          puts 'Wrong guess! Keep trying.'
        end
      end
      @turns += 1
      if @turns == 12
        puts 'Your turns are over! You lost the game. Better luck next time.'
        break
      end
    end
  end

  # when the player wins or loses the game
  def game_over
    loop do
      puts "\r"
      puts 'Game Over'
      print 'Would you like to play the game again? Type y for yes or n for no : '
      @choice = gets.chomp
      puts "\r"
      if @choice == 'y'
        MasterMind.new
      elsif @choice == 'n'
        puts "\r"
        puts 'Thanks for playing the game!'
        break
      else
        puts "Please answer in 'y' or 'n' only."
      end
    end
  end
end
