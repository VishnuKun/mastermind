module MyMethods

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
        puts "You've chosen :- "
        @flag = true
        @choice = 'mastermind'
      elsif @input.downcase == 'cb'
        puts "You've chosen :-"
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
  def get_guess(player)
    @flag = false
    @turns = 1
    puts 'Make sure the spellings are correct!'
    # run loop til all matches are '🟢' or turns are finished
    while !@flag || @turns < 13
      # get guess from Player
      print "Enter your guess #{player} : "
      @guess = gets.chomp
      @guess = @guess.split
      # call feedback method
      @answer = feedback_message(@guess)
      # check if all answers are '🟢' or not
      print 'Feedback Message : '
      puts @answer.join
      if @answer.all? { |answer| answer == '🟢' }
        # show user feedback
        @flag = true
        puts 'Game Over'
        break
      else
        # show user feedback
        puts 'Wrong guess! Keep trying.'
      end
      @turns += 1
    end
  end
end