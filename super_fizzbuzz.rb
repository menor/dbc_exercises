# PSEUDOCODE
# Please write your pseudocode here and keep it commented
# INPUT: An array of integers
# OUPUT: A modified array with integers and strings
# What are the steps to solve the problem?  Write them out in plain english as best you can.
# Select elements from the array divisible by 15 and replace them by the word "FizzBuzz"
# Select elements from the array divisible by 3 and replace them by the word "Fizz"
# Select elements from the array divisible by 5 and replace them by the word "Buzz"
# Return the modified array
 
 
# INITIAL CODE:
# This is the first version of code to pass the rspec tests and get all green.
def super_fizzbuzz(array)
  array.map do |i| 
    if i % 15 == 0 then 'FizzBuzz'
    elsif i % 3 == 0 then 'Fizz' 
    elsif i % 5 == 0 then 'Buzz'
    else i
    end
  end
end
 
# REFACTORED CODE:
# see: http://sourcemaking.com/refactoring/introduction-to-refactoring
def super_fizzbuzz(array)
  
  array.map do |i|
    case
      when i % 15 == 0 then 'FizzBuzz'
      when i % 3 == 0 then 'Fizz' 
      when i % 5 == 0 then 'Buzz'
      else i
    end
  end

end
 
# DRIVER CODE
def random_input_array(base, size)
  (1..size).map { |i| base**(1+rand(15)) }
end

puts super_fizzbuzz(random_input_array(3,100)) == ["Fizz"]*100
puts super_fizzbuzz(random_input_array(5,100)) == ["Buzz"]*100
puts super_fizzbuzz(random_input_array(15, 100)) == ["FizzBuzz"]*100
puts super_fizzbuzz([1,2,3]) == [1,2,'Fizz']
puts super_fizzbuzz([1,2,3,4,5]) == [1,2,'Fizz',4,'Buzz']
puts super_fizzbuzz([15, 5, 3, 1]) == ['FizzBuzz', 'Buzz', 'Fizz', 1]
 
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
#  I figured it out almost inmediately, I think I have done this one several times already.
#  It kinda works like the password validation challenge from yesterday, you check for negatives
#  and discard those first and return the unmodified element at the end. I refactored it using the 
#  case statement, cause I think they made the code more readable.
#  An array enters a modified array goes out so this is a perfect candidate for the map method.