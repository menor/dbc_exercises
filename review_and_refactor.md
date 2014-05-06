#Review others, refactor yours#

When I read the challenge objectives I thought of Reverse Polish Calculator inmediately, I solved this challenge using RegEx while most of my mates used an array, in some cases combined with RegEx to check for operators.

So I looked at 6 solutions, copy and pasted the methods into an RPN class and ran some benchmarks, here are the results:

![](http://i.imgur.com/k6Go7xs.png)

By the way, I don't know if I'm running the Benchmarks the right way, but it almost always throws the same results, so I'm guessing I'm doing it right.

First thing I noticed is that Irene implementation was almost twice as fast as most of the others, second is how slow Matthew implemetation was compared to others.

###Matthew's###
<pre>
def matthew(expression)
     raise ArgumentError.new("Invalid character") if !(/[^\d\s[*\+-]]/.match(expression).nil?)
     raise ArgumentError.new("Must have one more number than operators.") if expression.scan(/-?\d+/).length != expression.scan(/[\*\+-]\s|[\*\+-]$/).length + 1
    nums_and_operators = expression.split(/ /)
    current_answer = []
    nums_and_operators.each{|next_element|
      if /\d+/ =~next_element then current_answer << next_element.to_i
      else current_answer << current_answer.pop(2).reduce(next_element) end
      }
    current_answer.last
  end
 </pre>
I decided to look into Matthew's method to see if I can find the cause it was performing so slow, I removed the two Raise argument error statements and reran the tests

![](http://i.imgur.com/jZEQd3L.png)

It was still slower but not twice as slower as the rest so I guess the Arguments errors were guilty of slowing this down.

###Mazza's###
<pre>
def mazza(rpn_expression)
    digits = []
    # Split the string to calculate into an array and run through it.
    rpn_expression.split(" ").each do |x|
      # If the element is a digit, add it to the digit array.
      if x =~ /[\d]/
        digits << x.to_i
      else # Otherwise, perform the operation on the last two digits in the array.
        total = digits.pop(2)
        digits << total[0].send(x, total[1])
      end
    end
    #Return the final calculation
    digits[0]
  end
</pre>

Mazza's was my favourite solution cause it was one of the fastest ones, and also the most readable, I understood what was going on instantly, the comments helped a lot but also the fact that the code was very clean. She also used the `.send` method instead of a case statement, which I liked. I was going to base my refactoring in this one until I noticed Irene's performance.

###Irene's###
<pre>
def irene(expression)
    stack = []
    operators = ["+", "-", "*"]
    expression.split(" ").each do |op|
        stack << (operators.include?(op) ? evaluate_operator(stack.pop, stack.pop, op) : op.to_i)
    end
    stack.pop
  end
</pre>

Why was this one so fast respect of the others? What was she doing different, I compared this to Mazza's one and noticed the following differences:

1- She had encapsulated the case statement inside another method. So I'm going to use `.send` instead the case statement inside the method and see how this affects speed. This even improves the speed by a minuscule margin, so I'm going to use `.send` cause I prefer avoid having a method depend on another.

2 - The way of checking if a digit is an operator by seeing if it's included in an array where we defined the operators, instead of using a RegEx. This is the key! If I remove this from Irene's solution execution times almost double. So let's try adding that to Mazza's method and see how it performs. It improves its speed by more than one third.

### Conclusion ###

Using the `.include?` method against a predefined array is much faster than using a RegEx, at least in this case. So my refactoring is going to be basically Irene's solution but using the send method instead of the `evaluate_operator` case, I'm also removing the ternary operator to make this a little more clear. To use the send operator I also need to do something about sending the operands in correct order or the substraction won't function properly, I copy this from Hunter's solution and his clever use of `.pop`

Here it is my Refactored code, it's a little slower than Irene's but still faster than all the rest and also avoids dependace on an external method:
<pre>
class RPNCalculator
 
 def evaluate(expression)
    stack = []
    operators = ["+", "-", "*"]
    expression.split(" ").each do |op|
      stack << case 
        when operators.include?(op)
          operands = stack.pop(2)
          operands[0].send(op, operands[1])
        else op.to_i
      end
    end
    stack.pop
  end

end
</pre>


