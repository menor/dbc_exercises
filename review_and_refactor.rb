# My previous solution
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



# Refactored Solution
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

# Tests
rpn = RPNCalculator.new

puts rpn.evaluate('0') == 0
puts rpn.evaluate('1 2 +')  #== 3.to_f
puts rpn.evaluate('2 5 *')   #== 10
puts rpn.evaluate('50 20 -') #== 30
puts rpn.evaluate('70 10 4 + 5 * -') #== 0
puts rpn.evaluate('-1') # == -1


