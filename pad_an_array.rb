class Array
  def pad!(min_size, value = nil)
    size = min_size - self.length
    if size > 0
      padding = Array.new(size, value)
      self.concat(padding)
    end
    self
  end
  
  def pad(min_size, value = nil)
    self.clone.pad!(min_size, value)
  end
end

long_array = [1,2,3]*10

# Tests 
print [1,2,3].pad!(3)
print [1,2,3].pad!(5)
print [1,2,3].pad!(5, "apple")
print long_array.pad!(10)