# PSEUDOCODE
# Please write your pseudocode here and keep it commented
# INPUT: An 
# OUPUT: A class representing a die
# What are the steps to solve the problem?  Write them out in plain english as best you can.
# Make an instance array with each side name as an element (This was wrong)
# Make an instance variable containing the array passed as an argument
# Calculate how many elements that array has
# Define a method that returns a random element from that array


# INITIAL CODE:
# This is the first version of code to pass the rspec tests and get all green.

 class Die
  

  def initialize(labels)
    @labels = labels
    @sides = @labels.length
    raise ArgumentError.new("Too few sides!") unless @sides > 0
  end

  def labels
    @labels
  end

  def sides
    @sides
  end

  def roll
    @labels[rand(@sides)]
  end
end




# REFACTORED CODE:
# see: http://sourcemaking.com/refactoring/introduction-to-refactoring
class Die
  attr_reader :sides, :labels

  def initialize(labels)
    @labels = labels
    @sides = @labels.length
    raise ArgumentError.new("Too few sides!") unless @sides > 0
  end

  def roll
    @labels[rand(@sides)]
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
# It almost drives me crazy, I didn't took into account that what was being passed to the initialize method
# was already an array, not an undetermined serie of numbers that we had to turn into an array with the splat argument
# Once I realized that (by looking at the tests), it was easy. Lesson learned (not really) don't overcomplicate things
#
#


# TESTS
die = Die.new(['A', 'B', 'C', 'D', 'E', 'F'])
puts die.labels.length
puts die.labels
puts "sides #{die.sides}" # still returns the number of sides, in this case 6
puts die.roll # returns one of ['A', 'B', 'C', 'D', 'E', 'F'], randomly