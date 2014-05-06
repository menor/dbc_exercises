# PSEUDOCODE
# Please write your pseudocode here and keep it commented
# INPUT: A string
# OUPUT: An integer
# What are the steps to solve the problem?  Write them out in plain english as best you can.
# Go through the string until it finds an operator (+, -, *)
# Get the operator and the two previous numbers
# Apply the operator to the two numbers
# Replace the triplet (2 numbers and one operator) for the result of the  operation in the original string 
# Repeat until there are not operators in the string

class RPNCalculator

  def evaluate(string)
    while string.include?(' ')
      string.sub!(/(-?\d+)\s(-?\d+)\s([\+\-\*])/) {
        $1.to_i.send($3, $2.to_i)
      }
    end #while ends 
    string.to_i
  end

end


# REFACTORED CODE:
# see: http://sourcemaking.com/refactoring/introduction-to-refactoring
class RPNCalculator

  def evaluate(string)
    while string.include?(' ')
      string.sub!(/(-?\d+)\s(-?\d+)\s([\+\-\*])/) { # (Negative sign? Number) Space (Negative sign? Number) Space (one of those +-*)
        $1.to_i.send($3, $2.to_i) # The result from this SUBSTITUTES the entire match
      }
    end #while ends 
    string.to_i # We need a number, not a string
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
# Started working with Chris on this one
# We saw here the perfect ocassion for RegEx since we were looking for patterns in a string
# I learned to use .send(argument1, *argument2) It executed argument1 using *arguments2 as its arguments
# $1, $2 etc.. are superpowerful ways to assign pattern matches to variables
# There's also things like '$ and `$ to access the part of the string after or before the match that I'd like to know more about
# I did lots of stupid mistakes, like not returning the string, also it took me a while to make negative
# numbers work since I started checking for a sign in the while loop, the sky opened once I replaced
# that with a space.
# For refactoring I think that I can make that while loop into one line, but lines are cheap and I think
# the code is more readable keeping it as it is.
# I would like to benchmark this against other sstudent solutions to see how fast this is compared to using
# other methods.

# TESTS 
rpn = RPNCalculator.new

puts rpn.evaluate('0') == 0
puts rpn.evaluate('1 2 +')  #== 3.to_f
puts rpn.evaluate('2 5 *')   #== 10
puts rpn.evaluate('50 20 -') #== 30
puts rpn.evaluate('70 10 4 + 5 * -') #== 0
puts rpn.evaluate('-1') # == -1