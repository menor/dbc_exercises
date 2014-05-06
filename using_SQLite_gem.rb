require 'sqlite3'
$db = SQLite3::Database.open "congress_poll_results.db"

def state_to_abbr(state)
  state_abbr = {
  'AL' => 'Alabama',
  'AK' => 'Alaska',
  'AS' => 'America Samoa',
  'AZ' => 'Arizona',
  'AR' => 'Arkansas',
  'CA' => 'California',
  'CO' => 'Colorado',
  'CT' => 'Connecticut',
  'DE' => 'Delaware',
  'DC' => 'District of Columbia',
  'FM' => 'Micronesia1',
  'FL' => 'Florida',
  'GA' => 'Georgia',
  'GU' => 'Guam',
  'HI' => 'Hawaii',
  'ID' => 'Idaho',
  'IL' => 'Illinois',
  'IN' => 'Indiana',
  'IA' => 'Iowa',
  'KS' => 'Kansas',
  'KY' => 'Kentucky',
  'LA' => 'Louisiana',
  'ME' => 'Maine',
  'MH' => 'Islands1',
  'MD' => 'Maryland',
  'MA' => 'Massachusetts',
  'MI' => 'Michigan',
  'MN' => 'Minnesota',
  'MS' => 'Mississippi',
  'MO' => 'Missouri',
  'MT' => 'Montana',
  'NE' => 'Nebraska',
  'NV' => 'Nevada',
  'NH' => 'New Hampshire',
  'NJ' => 'New Jersey',
  'NM' => 'New Mexico',
  'NY' => 'New York',
  'NC' => 'North Carolina',
  'ND' => 'North Dakota',
  'OH' => 'Ohio',
  'OK' => 'Oklahoma',
  'OR' => 'Oregon',
  'PW' => 'Palau',
  'PA' => 'Pennsylvania',
  'PR' => 'Puerto Rico',
  'RI' => 'Rhode Island',
  'SC' => 'South Carolina',
  'SD' => 'South Dakota',
  'TN' => 'Tennessee',
  'TX' => 'Texas',
  'UT' => 'Utah',
  'VT' => 'Vermont',
  'VI' => 'Virgin Island',
  'VA' => 'Virginia',
  'WA' => 'Washington',
  'WV' => 'West Virginia',
  'WI' => 'Wisconsin',
  'WY' => 'Wyoming'
}
  state_abbr.key(state)
end

def print_longest_serving_reps(minimum_years)
  raise ArgumentError.new("Argument needs to be a number") unless minimum_years.is_a? Integer # Prevents SQL injection
  puts "LONGEST SERVING REPRESENTATIVES"
  $db.execute("SELECT name, years_in_congress FROM congress_members WHERE years_in_congress > #{minimum_years}").each { |rep| puts rep.join(' - ') + ' years' }
end

def print_lowest_grade_level_speakers(maximum_grade)
  raise ArgumentError.new("Argument needs to be a number") unless maximum_grade.is_a? Integer # Prevents SQL injection
  puts "LOWEST GRADE LEVEL SPEAKERS (less than #{maximum_grade}th grade)"
  $db.execute("SELECT name, grade_current FROM congress_members WHERE grade_current < #{maximum_grade}").each { |speaker, grade| puts speaker + " - Grade: " + grade.round(1).to_s}
end

def print_representatives_for_states(*selected_states) # Modified this to take a list of states as arguments
  selected_states.each do |state|
    puts "REPRESENTATIVES FOR " + state.upcase
    puts $db.execute("SELECT name FROM congress_members WHERE location = '#{state_to_abbr(state)}'") # Translates state to its abbr so we can look for it in the database
    print_separator
  end
end

def print_votes_per_politician
  puts "VOTES PER POLITICIAN"
  vote_count = $db.execute("SELECT name, COUNT(politician_id) FROM congress_members INNER JOIN votes ON congress_members.id = politician_id GROUP BY name ORDER BY COUNT(politician_id) DESC")
  vote_count.each {|politician, votes| puts politician + ' - ' + votes.to_s + ' votes'}
end

def print_voters_per_politician
  all_politicians = $db.execute("SELECT name FROM congress_members")
  all_politicians.flatten!.each do |politician|
    puts "List of people who voted for #{politician}:"
    voters = $db.execute("SELECT first_name, last_name FROM congress_members INNER JOIN votes ON congress_members.id = politician_id INNER JOIN voters ON voters.id = votes.voter_id WHERE name = '#{politician}'")
    puts voters.map{|name, surname| name + ' ' + surname}.join(", ")
  end
end

def print_separator
  puts 
  puts "------------------------------------------------------------------------------"
  puts 
end


print_representatives_for_states('Arizona', 'Hijoputa')
print_longest_serving_reps(35)
# Print out the number of years served as well as the name of the longest running reps
# output should look like:  Rep. C. W. Bill Young - 41 years
print_separator
print_lowest_grade_level_speakers(8)
print_separator

print_representatives_for_states('New Jersey', 'New York', 'Maine', 'Florida', 'Alaska')
#  Make a method to print the following states representatives as well:
# (New Jersey, New York, Maine, Florida, and Alaska)

##### BONUS #######
# Stop SQL injection attacks!  Statmaster learned that interpolation of variables in SQL statements leaves some security vulnerabilities.  Use the google to figure out how to protect from this type of attack.
# I can raise an error if the arguments for print_longest_serving_reps and print_lowest_grade_level_speakers(8)
# are not integers, I don't have that problem in print_representatives_for_states since I'm converting the
# arguments passing them through the Hash
# I got some info from here http://guides.rubyonrails.org/security.html#injection

#  (bonus)
# Create a listing of all of the Politicians and the number of votes they recieved
print_votes_per_politician
# output should look like:  Sen. John McCain - 7,323 votes
# Create a listing of each Politician and the voter that voted for them
# output should include the senators name, then a long list of voters separated by a comma
#
# * you'll need to do some join statements to complete these last queries!
print_voters_per_politician
# Generate an array with all the politicians names
# Create the list of voters for each one

# REFLECTION
# This was just a matter of figuring what to SELECT and what to do with that data once retrieved
# The .inspect method works wonders for this kind of work, cause it lets you see what kind of primitive
# (or primitive inside of another primitive) you are dealing with. 
# For creating the queries I use SQLite Pro, it's a very simple GUI for SQLite that works better for me than 
# the terminal
# I changed the print_representatives_for_states to accept any number of states as an argument, and use a hash
# to 'translate' the state names to the format they are stored in the database.
# The method to print voters per politicians takes more than 4 seconds to run, I'm not happy about that but
# don't know how to make it go faster.

