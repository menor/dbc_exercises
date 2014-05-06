=begin
 
 
As you are debugging, ask yourself:
* Do you have enough information to decipher the problem?  
* Is the error message referencing a line in your file, or a different file?
* Is there a methodology that you are following to systematically tackle these bugs?  What is a step by step approach? 
 
 
###2) Decipher the bugs
For each bug (there are three initial bugs that cause interpreter errors), answer the following questions:
 
--- Bug 1 ---
* what is the exact description of the error?
  valid_triangle? expects 3 arguments
  expected: 3 got: 4 (compared using ==)
* what is the exact line number the error is appearing?
  Line 1
* before you fix the bug, what do you think is causing the error?
  The tests expect tht method to take 3 arguments, the method is defined as having four

--- Bug 2 ---
* what is the exact description of the error?
  valid_triangle? returns false if any of the arguments are 0
  expected: false value got: true
* what is the exact line number the error is appearing?
  line 26
* before you fix the bug, what do you think is causing the error?
  Instead of returning the false boolean (without quotes) it's returning a string with the value of 'false'.
  It wasn't that it was the check in line 3 instead of checking if one of the conditions is 0 (using or),
  we should check if all three of them are not 0 (using and)
 
--- Bug 3 ---
* what is the exact description of the error?
    valid_triangle? returns false for any impossible triangle
    expected: true value got: false
* what is the exact line number the error is appearing?
    line 22
* before you fix the bug, what do you think is causing the error?
    This confuses me cause I thought that 'true' is true since is a string, but the problem is in line 22,
    where it returns 'false' instead of the boolean false. I know this cause fixing that line makes the 
    program pass the tests. But I don't know where it gets the false it tells me in the error.
    Line 20, works but I'm going to change 'true' to a boolean to be on the safe side.
 
###3) Pass the tests 
 
--- Last Bug ---
The last bug isn't causing interpreter errors, but it's causing the output of the program to fail the RSpec tests.  
 
When you solve the error, describe what is happening as clearly as possible:
I just got the errors above, sorry.

###4) Review your process and methodology
 
* What were your steps to tackle this problem?
 Format the code
 Run the code.
 Look at test results
 Try to figure out what's causing the error.
 Try to solve the error.
 Run the tests again.
 Watch satisfied the green divs.

* Write down the processes you followed that could be applied in other debugging situations.
Format the code
 Run the code.
 Look at test results
 Try to figure out what's causing the error.
 Try to solve the error.
 Run the tests again.
 Watch satisfied the green divs.
 
 
###5) Submit and Reflect 
 
Review other solutions and the canonical solution listed on the "Review and Reflect" tab.  
 
Take a moment to reflect on the canonical solution and the solutions of other students. Add any insights to your gist to help distill your own process here:
I don't remember how I came up with it, but I think I just applied the formula. I prefer my solution to the one on this gist,
I think is shorter and easier to understand.

def valid_triangle?(a, b, c)
  return (a+b > c) && (a+c > b) && (b+c > a) 
end
 
=end
 
###Include your final code below (with driver code and expectations!):

def valid_triangle?(a, b, c)
  sum = 0
  if a != 0 && b != 0 && c != 0
    if a >= b
      largest = a
      sum += b
    else
      largest = b
      sum += a
    end
    
    if c > largest
      sum += largest
      largest = c
    else
      sum += c
    end
    
    if sum > largest
      return true
    else
      return false
    end
    
  else
    return false
  end
  
end

# DRIVER CODE

puts valid_triangle?(3,4,5) == true
puts valid_triangle?(65, 72, 97) == true
puts valid_triangle?(115, 252, 277) == true
puts valid_triangle?(120, 209, 241) == true
puts valid_triangle?(0, 0, 0) == false
puts valid_triangle?(1, 1, 2.01) == false
puts valid_triangle?(50, 70, 200) == false


