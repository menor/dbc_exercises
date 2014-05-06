# PSEUDOCODE
# Please write your pseudocode here and keep it commented
# INPUT: An integer representing the right answer
# OUPUT: A class with several methods
# What are the steps to solve the problem?  Write them out in plain english as best you can.
#  Initialize the method, with two instance variables solved and answer
#  Define a method to check if the answer is right, low or high
#  Define a method that returns the state of solved



# INITIAL CODE:
# This is the first version of code to pass the rspec tests and get all green.
class GuessingGame
  attr_accessor :solved

  def initialize(answer)
    @answer = answer
    @solved = false
  end

  def solved?
    @solved
  end

  def guess(guess)
    if guess == @answer
      @solved = true
      :correct
    else
      @solved = false
      guess > @answer ? :high : :low
    end
  end

end






# REFACTORED CODE:
# see: http://sourcemaking.com/refactoring/introduction-to-refactoring
class GuessingGame
  
  def initialize(answer)
    @answer = answer
    @solved = false
  end

  def solved?
    @solved
  end

  def guess(guess)
    if guess == @answer # handles correct answers
      @solved = true
      :correct
    else  # handles incorrect answers
      @solved = false
      guess > @answer ? :high : :low
    end
  end

end

## NEW REFACTORING 
class GuessingGame
  
  def initialize(answer)
    @answer = answer
  end

  def solved?
    @solved == :correct
  end

  def guess(guess)
    @solved = :correct if guess == @answer # handles correct answers
    guess > @answer ? @solved = :high : @solved = :low # handles incorrect answers
  end

end





# REVIEW/REFLECT
# Reflection is vital to learning and growth. These challenges should not be thought of as items 
# to check off;  they are your opportunities to learn and grow as a programmer. 
# Use the following questions to reflect on this challenge.
# Was your strategy for solving the challenge successful?
# What part of your strategy worked? What parts were challenging?
# What questions did you have while coding? Did you find answers to them?
# Are there any concepts that are still confusing to you?
# Did you learn any new skills or ruby tricks?

# INCLUDE REFLECTION HERE:
# This one was easy, the only problem I had is that I tried to crate a variable
# called @solved? and the question mark is not allowed in instance variable names
# so I had to create a method called solved? whose only mission is to return the 
# state of @solved
# In refactoring I removed the Attr_accessor since we already have the solved?
# method for that
# I think I have the distinction between instance variables and class variables
# clear, or so I hope.


## TESTS
game = GuessingGame.new(10)

puts game.solved?   # => false

puts game.guess(5)  # => :low
puts game.guess(20) # => :high
puts game.solved?   # => false

puts game.guess(10) # => :correct
puts game.solved?   # => true

