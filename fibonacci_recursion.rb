# PSEUDOCODE
# Please write your pseudocode here and keep it commented
# INPUT:
# OUPUT:
# What are the steps to solve the problem?  Write them out in plain english as best you can.
# First I'm going to try to adapt the method from the previous exercise to use recursion.
# It didn't worked so
# We get a test number and two initial values to be added
# We check if the first number to add (we use this instead of the last one to also catch 0) is equal to the test, return true if it is
# If not we check if last is greater than the number to test, which means test it's not included in the series
# If none of the two apply, we call the method again with the same test number, the last value
#  as the first element to be added, and the sum of the last and previous values as the 
#  second value to be added
 
 
# INITIAL CODE:
# This is the first version of code to pass the rspec tests and get all green.

def fibonacci(test, previous, last)
  if previous == test
    return true
  elsif previous > test
    return false
  else
    fibonacci(test, last, (last + previous))
  end
end

def is_fibonacci?(i)
  fibonacci(i,0,1)
end
 
# REFACTORED CODE:
# see: http://sourcemaking.com/refactoring/introduction-to-refactoring
 def is_fibonacci?(test, previous=0, last=1)
  if previous == test # We use previous instead of last to also check for 0
    true
  elsif previous > test 
    false
  else
    is_fibonacci?(test, last, (last + previous))
  end
end
 
# DRIVER TEST CODE
# This code calls your above methods and passes arguments (input) and equates it to an expectation (output)
# eg   puts find_product(10, 3) == 30    
#Include all your tests below:
def random_fibonacci
   [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946].sample
end
 
# "returns true when a integer is one number of the Fibonacci sequence" do
puts is_fibonacci?(random_fibonacci) == true

# "returns true with 0" do
puts is_fibonacci?(0) == true


# "returns true with a large Fibonacci number" do
puts is_fibonacci?(8670007398507948658051921) === true

# "returns false when it's not in the Fibonacci sequence" do
puts is_fibonacci?(random_fibonacci+100) == false

# "returns false on large non-Fibonacci numbers" do
puts is_fibonacci?(927372692193078999171) == false

 
 
 
 
# REVIEW/REFLECT
# Reflection is vital to learning and growth. These challenges should not be thought of as items to check off; 
# they are your opportunities to learn and grow as a programmer. Use the following questions to reflect on this challenge.
# Was your strategy for solving the challenge successful?
# What part of your strategy worked? What parts were challenging?
# What questions did you have while coding? Did you find answers to them?
# Are there any concepts that are still confusing to you?
# Did you learn any new skills or ruby tricks?
 
# INCLUDE REFLECTION HERE:
# First I tried to adapt my Fibonacci method from the last exercise, but using recursion this time.
# I couldn't do it because I didn't know how to store the results in an array recursively. I fought
# the problem for a long time and I decided to take a rest. Then pair programming with Hunter I asked
# about this and he pointed me to an article about tail recursion and it all made sense, I was trying
# to use tree recursion in this one and had no way to check for intermediate values. So I guess you 
# can use tree recursion when you are only interested in the final result, if you need some way to keep
# track of intermediate values, use tail recursion.
# After seeing his solution I tried to make my own using an array (I know, I'm so stubborn) but
# couldn't  figure it out so I used Hunter's.
# I now understand that basically tail recursion is like a loop where you put your conditions to
# break the loop first, and then make the function call itself.
# Still have read examples about it though, to have it completely clear.