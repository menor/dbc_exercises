def median(array)
  sorted = array.sort!
  size_of_array = sorted.length
  if size_of_array.even?
    part_1 = sorted[size_of_array / 2 - 1]
    part_2 = sorted[size_of_array / 2]
    puts "part1 is #{part_1}"
    puts "part2 is #{part_2}"
    median = (part_1 + part_2) / 2
  else 
    median = sorted[(size_of_array /2).ceil]
  end
  
end


puts (-100 + 100)/2
puts median([1,2,3])      # => 2
puts median([4.5, 0, -1]) # => 0
puts median([-100, 100])  # => 0.0

# if is even two middle values / 2
# if is odd middle value