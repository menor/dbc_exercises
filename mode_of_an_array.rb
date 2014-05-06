
def mode(array)
  frequencies = {}
  
  array.each do |i|
    if frequencies.key?(i)
      frequencies[i] += 1
    else
      frequencies[i] = 1
    end
  end
  top_frequency = frequencies.values.max
  top_frequencies = frequencies.collect { |key, value| key if value == top_frequency }.compact
  
end
