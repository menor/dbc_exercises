# PSEUDOCODE
# Please write your pseudocode here and keep it commented
# INPUT: A string for each of the methods
# OUPUT:  1) A Boolean
#         2) A String
#         3) An Array
# What are the steps to solve the problem?  Write them out in plain english as best you can.
#  1) Check if the string has a pattern that matches a Social Security number
#  2) Look for the part of a string containing the Social Security number.
#     Return that Social Security number.
#  3) Scan a string and return an array containing all the Social Security number matches.
#  4) Locate Social Security numbers occurrences in a string and substitute the first 5 characters for 'X'
#  5) Locate 9 numbers series in a string having dashes, points, or nothing in between and format them like a proper SOcial Security number using dashes.
 
 
 
# INITIAL CODE:
# This is the first version of code to pass the rspec tests and get all green.

# Determine whether a string contains a Social Security number.
def has_ssn?(string)
  string.match(/\d{3}-\d{2}-\d{4}/)? true : false
end

# Return the Social Security number from a string.

def grab_ssn(string)
  if has_ssn?(string)
    ssn = string.match(/\d{3}-\d{2}-\d{4}/)[0] # Since match returns a Matchdata object, we get only the string from that object using [0]
  end
end

# Return all of the Social Security numbers from a string.
def grab_all_ssns(string)
  string.scan(/\d{3}-\d{2}-\d{4}/)
end

# Obfuscate all of the Social Security numbers in a string. Example: XXX-XX-4430.
def hide_all_ssns(string)
  string.gsub(/\d{3}-\d{2}/, "XXX-XX")
end

# Ensure all of the Social Security numbers use dashes for delimiters.
# Example: 480.01.4430 and 480014430 would both be 480-01-4430.
def format_ssns(string)
  string.gsub(/(\d{3})[-\.]?(\d{2})[-\.]?(\d{4})/, '\1-\2-\3' )
end

## Write some tests
puts has_ssn?("please don't share this: 234-60-1422") == true  
puts has_ssn?("please confirm your identity: XXX-XX-1422") == false  
puts grab_ssn("please don't share this: 234-60-1422") == "234-60-1422"? true : false
puts grab_ssn("please confirm your identity: XXX-XX-1422") == nil
puts grab_all_ssns("234-60-1422, 350-80-0744, 013-60-8762") == ["234-60-1422", "350-80-0744", "013-60-8762"]
puts grab_all_ssns("please confirm your identity: XXX-XX-1422") == []


# REFACTORED CODE:
# see: http://sourcemaking.com/refactoring/introduction-to-refactoring
 def has_ssn?(string)
  (/\d{3}-\d{2}-\d{4}/) =~ string # The method =~ returns a boolean so no need for a conditional here
end

# Return the Social Security number from a string.

def grab_ssn(string)
    string.slice(/\d{3}-\d{2}-\d{4}/) # Slice returns the matched pattern or nil, so no need for conditional here neither.
end

# Return all of the Social Security numbers from a string.
def grab_all_ssns(string)
  string.scan(/\d{3}-\d{2}-\d{4}/) 
end

# Obfuscate all of the Social Security numbers in a string. Example: XXX-XX-4430.
def hide_all_ssns(string)
  string.gsub(/\d{3}-\d{2}/, "XXX-XX") 
end

# Ensure all of the Social Security numbers use dashes for delimiters.
# Example: 480.01.4430 and 480014430 would both be 480-01-4430.
def format_ssns(string)
  string.gsub(/(\d{3})[-\.]?(\d{2})[-\.]?(\d{4})/, '\1-\2-\3' ) # It also looks for dashes optionally to detect also ssn numbers missing a dash
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
# Did this one with Armando and once we discovered we were using backslashes instead
# of forward slashes to delimit the RegEx it all went smoothly.
# We had read recntly about the methods that use RegEx so it was only a matter of
# getting the expression right in Rubular and employing the appropiate method in each case.
# We struggled a little in the second method, until we discovered that .match returns a 
# Matchdata object and we had to extract the match from there.
# Refactoring I saw the chance to remove some conditionals and use the proper method instead,
# like slice in the second method (I saw Wu was using it)
