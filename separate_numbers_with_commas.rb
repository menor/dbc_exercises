# PSEUDOCODE
# Please write your pseudocode here and keep it commented
# INPUT: an Integer
# OUPUT: a String
# What are the steps to solve the problem?  Write them out in plain english as best you can.
# We get the number and starting from the end we insert a comma (,)
# every three characters. I loop starting from the end of the number,
# pushing them into a string one by one, once the counter reaches three
# I insert a comma instead of the next number, then I repeat the same process
# from where it was left.
 
 
# INITIAL CODE:
# This is the first version of code to pass the rspec tests and get all green.
 
def separate_comma(number)
   number.to_s.gsub(/(\d)(?=(\d{3})+$)/, '\1,')
end
 
# REFACTORED CODE:
# see: http://sourcemaking.com/refactoring/introduction-to-refactoring

def separate_comma(number)
   number.to_s.gsub(/(\d)(?=(\d{3})+$)/, '\1,')
end 
# - Starts from the end ($)
# - Once it finds a chipher (\d):
#    - Looks ahead (?=) to see if it finds:
#       - Three consecutive digits (\d{3})
#       - Followed or not by more groups of three consecutive digits (+)
#    - Once it finds it:
#       - Stores the first digit into the first group
#       - Stores the other three into the second group
#       
# We just only have to use gsub to add a comma to every "first digit"
 
 
 
# DRIVER TEST CODE
# This code calls your above methods and passes arguments (input) and equates it to an expectation (output)
# eg   puts find_product(10, 3) == 30    
# Include all your tests below:
def random_num(min, max)
   rand(max - min + 1) + min
end

# "returns no comma, when the integer is smaller than 1000" do
puts separate_comma(random_num(0,999)).match(/^\d{1,3}$/)? true : false

# returns one comma, when the integer is between 1000 and 999999" do
puts separate_comma(random_num(1000, 999999)).match(/^\d{1,3},\d{3}$/)? true : false

# "returns two commas, when the integer is between 1000000 and 999999999" do
puts separate_comma(random_num(1000000, 999999999)).match(/^\d{1,3},\d{3},\d{3}$/)? true : false

# Test if it works with negative numbers
puts separate_comma(random_num(-999999, -1000)).match(/^[-]\d{1,3},\d{3}$/)? true : false
 
 
 
 
# REVIEW/REFLECT
# Reflection is vital to learning and growth. These challenges should not be thought of as items to check off; 
# they are your opportunities to learn and grow as a programmer. Use the following questions to reflect on this challenge.
# Was your strategy for solving the challenge successful?
# What part of your strategy worked? What parts were challenging?
# What questions did you have while coding? Did you find answers to them?
# Are there any concepts that are still confusing to you?
# Did you learn any new skills or ruby tricks?
 
# INCLUDE REFLECTION HERE:

# My initial pseudo code was this:
# We get the number and starting from the end we insert a comma (,)
# every three characters. I loop starting from the end of the number,
# pushing them into a string one by one, once the counter reaches three
# I insert a comma instead of the next number, then I repeat the same process
# from where it was left.
# I was going to use a loop instead of a regex but Chapman wasn't happy about
# that, so I told him to drive and he came up with the regex that:
# 
# - Starts from the end ($)
# - Once it finds a chipher (\d):
#    - Looks ahead (?=) to see if it finds:
#       - Three consecutive digits (\d{3})
#       - Followed or not by more groups of three consecutive digits (+)
#    - Once it finds it:
#       - Stores the first digit into the first group
#       - Stores the other three into the second group
#       
# We just only have to use gsub to add a comma to every "first digit"
# 
# 
# My strategy of using a loop would have resulted in the end, but the RegEx is much
# elegant, I also benchmarked this against some of the other student solutions, and it
# was the second faster, after Dahl solution who used a case statement, I thought of
# copying Dahl solution, but I'll sacrifice the gain in speed for the clean code.
# 
# Obviously I have to devote some time in the weeks to com to practice my RegEx-Fu
