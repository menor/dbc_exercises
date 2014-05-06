# PSEUDOCODE
# Please write your pseudocode here and keep it commented
# INPUT: An integer
# OUPUT: A class with a method to check if the integer meets some conditions
# What are the steps to solve the problem?  Write them out in plain english as best you can.
# We check if the argument passed is 16 digits long
# We go through the number and multiply by two digits in odd positions
# We add all the resulting digits and compare with 0
 
 
 # INITIAL CODE:
# This is the first version of code to pass the rspec tests and get all green.

# Don't forget to check on intialization for a card length
# of exactly 16 digits
class CreditCard
  def initialize(card_number)
    @card_number = card_number.to_s
    raise ArgumentError.new("A poor man trying to cheat! Bring him down!") if @card_number.length != 16
  end

  def check_card
    @control_number = @card_number.gsub(/(\d)(\d)/) { ($1.to_i*2).to_s + $2 }
    @control_number.split('').inject(0){|sum,digit| sum+digit.to_i}%10 == 0
  end

end
 
# REFACTORED CODE:
# see: http://sourcemaking.com/refactoring/introduction-to-refactoring
 class CreditCard
  def initialize(card_number)
    @card_number = card_number.to_s # We turn the number into a string so we can use length and gsub
    raise ArgumentError.new("A poor man trying to cheat! Bring him down!") if @card_number.length != 16 
  end

  def check_card
    @control_number = @card_number.gsub(/(\d)(\d)/) { ($1.to_i*2).to_s + $2 } # Doubles digits in odd positions
    @control_number.split('').inject(0){|sum,digit| sum+digit.to_i}%10 == 0
    # Adds all the digits, divides it by ten and checks te modulo agaist 0
    # Since the elements in the array are strings we need to pass inject an initial value of 0
    # so it doesn't use the first element before it is converted to an integer.
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
# This challenge has teached me about the importance of using the right primitive for the job
# I wanted to use gsub in there instead of something like each_index so I could avoid putting
# a conditional. For the last sum though I tought of doing it through RegEx too
# but I couldn't come with a solution as succint as inject, that seems made for this job. 
# So I converted the string to an array. The array elements were strings so I had to convert
# them into Integers to be able to add them, that's the cause I can not use inject without passing
# an initial value, if not it would take the first element of the array before it gets converted
# to an Integer so It'll throw an error when we try to add them.


## TESTS
# puts testcard = CreditCard.new(1234567812345678)
# puts testcard.check_card  
