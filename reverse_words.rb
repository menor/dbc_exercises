# INPUT: A string
# OUPUT: A string with the word reversed.
# What are the steps to solve the problem?  Write them out in plain english as best you can.
# We get each word separately.
# We reverse each word.
# We return a string with the words reversed joined by spaces.
  
# INITIAL CODE:
# This is the first version of code to pass the rspec tests and get all green.
 def reverse_words(string)
  string.gsub(/\w+/) { |word| word.reverse! } 
 end
 
# TESTS
def random_word(length = 5)
  rand(36**length).to_s(36)
end

puts reverse_words("holy shit batman") == "yloh tihs namtab"
puts reverse_words("") == ""
word1 = random_word
word2 = random_word
word3 = random_word
puts reverse_words(word1) == word1.reverse
puts reverse_words(word1 + ' ' + word2) == word1.reverse + ' ' + word2.reverse
puts reverse_words(word1 + ' ' + word2 + ' ' + word3) == word1.reverse + ' ' + word2.reverse + ' ' + word3.reverse

# REFACTORED CODE:
# see: http://sourcemaking.com/refactoring/introduction-to-refactoring
 def reverse_words(string)
  string.gsub(/\w+/) { |word| word.reverse } 
 end
# just removed the ! in reverse
 
 
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
#  Worked with Armando in this one, it seemed too easy so we investigated the method they were using in the tests to
#  get a random word, they are generating a random number in base 36 so it uses all the numbers and every letter
#  in the alphabet, it's not an actual word but a number.
#
#
