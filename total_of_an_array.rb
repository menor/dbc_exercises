def total(array)
  sum = 0
  array.each {|i| sum += i if i.is_a? Integer || Float }
  return sum
end

puts total([1,2,3, "A"])      # => 6
puts total([4.5, 0, -1]) # => 3.5
puts total([-100, 100]) 