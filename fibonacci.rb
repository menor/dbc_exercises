# PSEUDOCODE
# Please write your pseudocode here and keep it commented
# INPUT: An integer
# OUPUT: A boolean telling if the integer is included in the Fibonacci series
# What are the steps to solve the problem?  Write them out in plain english as best you can.
# Create a Fibonacci serie until you reach the value passed
# Check if the value is included in the serie
#
 
 
 
# INITIAL CODE:
# This is the first version of code to pass the rspec tests and get all green.
def is_fibonacci?(n)
  fibonacci_numbers = [0, 1]
  while n > fibonacci_numbers[-1]
    x = fibonacci_numbers[-1] # Last number in the array
    y = fibonacci_numbers[-2] # Second to last number in the array
    fibonacci_numbers.push(x+y) # We add them and push them into the array
  end
  fibonacci_numbers.include?(n)? true : false
end
 
 
 
# REFACTORED CODE:
# see: http://sourcemaking.com/refactoring/introduction-to-refactoring
 def is_fibonacci?(n)
  fibonacci_numbers = [0, 1]
  while n > fibonacci_numbers[-1]
    fibonacci_numbers << (fibonacci_numbers[-1] + fibonacci_numbers[-2]) # Last number in the array + Second to last number in the array gets pushed
  end
  fibonacci_numbers.include?(n) # No need to compare since include? already returns a boolean
end

 
 
# DRIVER TEST CODE
# This code calls your above methods and passes arguments (input) and equates it to an expectation (output)
# eg   puts find_product(10, 3) == 30    
# Include all your tests below:
def random_fibonacci
   [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946].sample
end
 
# "returns true when a integer is one number of the Fibonacci sequence" do
puts is_fibonacci?(random_fibonacci) == true

# "returns true with 0" do
puts is_fibonacci?(0) == true


# "returns true with a large Fibonacci number" do
puts is_fibonacci?(8670007398507948658051921) === true

# "returns false when it's not in the Fibonacci seqence" do
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
# I started to work on this with Buchanan and we tried to solve it using recursion,
# we couldn't. I left Buchanan alone against recursion cause I was getting dizzy trying
# to solve this one. After dinner I was watching TV and the solution appeared "magically".
# I use this technique a lot in my graphic design, I work in a problem for a while, put
# all the references in the back of my mind and let the unconscious do the heavy lifting.
# Sooner than later the answer percolates to the conscious. You have to work in the problem
# first! It doesn't work if you don't invest time reading references and trying to solve the
# problem first. That is one of my concerns, how to integrate this method into remote pair programming.
# 
# I'm happy with how the array solution works, I understood how recursion works (I came up with the tree
# model) but I-m not comfortable using it yet, so I have to invest some time in it.
#






