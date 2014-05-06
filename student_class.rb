class Student
  attr_reader :scores, :first_name, :ssn
 
  def initialize(first_name, *scores, ssn)
    @first_name = first_name
    @ssn = ssn
    @scores = scores.flatten
  end
  
  def average
    @scores.reduce(:+) / @scores.length
  end
  
  def letter_grade
    "A" if average >= 90
    "B" if average >= 80
    "C" if average >= 70
    "D" if average >= 60
    "E" if average >= 50
    "F"
  end
  
end

def linear_search(array, search_term)
  array.find_index { |student| student.first_name == search_term } || -1
  # If find_index returns nil (no element found) then we return -1
end

def random_ssn
  ssn = rand(100000000..999999999).to_s # Generates a random 9 ciphers number
  ssn.gsub(/(\d{3})(\d{2})(\d{4})/) {$1 + '-' + $2 + '-' + $3} # Inserts the dashes
end 

def sort_by_ssn(students)
  students.sort_by {|student| student.ssn.sub(/(\d{3})-(\d{2})-(\d{3})/) { $1+$2+$3 }}
  # this sorts the array using whatever the block returns, in this case it returns the ssn
  # with the dashes removed
end

def binary_search(students, ssn)
  students.find_index { |student| student.ssn == ssn} || -1
  # Similar to linear search 
end

#1. Create an array of 5 Students each with 5 test scores between 0 and 100.
# The first Student should be named "Alex" with scores [100,100,100,0,100]

students = [Student.new("Alex",100,100,100,0,100, '111-11-1111')]

student_names = ['Jose', 'Mason', 'Perico', 'Andre']

student_names.each do |name|
  grades = []
  5.times {grades.push(rand(100))}
  students.push(Student.new(name, grades, random_ssn))
end

#===========DRIVER CODE : DO NOT MODIFY =======
 
#Make sure these tests pass
# Tests for part 1:
 
p students[0].first_name == "Alex"
p students[0].scores.length  == 5
p students[0].scores[0] == students[0].scores[4]
p students[0].scores[3] == 0
 
 
# Tests for part 2
 
p students[0].average == 80
p students[0].letter_grade  == 'B'
 
# Tests for part 3
 
p linear_search(students, "Alex") == 0
p linear_search(students, "NOT A STUDENT")  == -1


# Tests for optional objective 2

# Part 1
students = sort_by_ssn(students)
students.each {|student| p student.ssn}
p students[0].ssn < students[1].ssn
p students[3].ssn > students[0].ssn

# Part 2
p binary_search(students, "111-11-1111") == 0
p binary_search(students, "000-00-0000") == -1
