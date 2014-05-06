# Pseudocode numbers up to 1000
# If the number is 1000 return 'a thosand'
# If the number is 0 return 'zero'
# Divide the number by a hundred to get the hundreds
#   Add the hundreds units to the number to words
#   Add the word 'hundreds' if hundreds units not equals 0
# Get the modulo of the number by a hundred to get the part we still haven't converted
# Divide the remaining number by 10 to get the tenths
#   If the division returns 1 go to the special cases
#   Else return the tenth word
# Get the modulo of the number by a ten to get the part we still haven't converted
# Convert that modulo to the unit word if it's not zero

def to_words(number)
  return 'zero' if number === 0           # Special case

  units_to_words = ['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  tenths_to_words = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty','seventy', 'eighty', 'ninety']
  teens_to_words = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
  illions = {
    # I can keep adding names and bases here when needed
    21 => 'sextillion',
    18 => 'quintillion',
    15 => 'cuatrillion', 
    12 => 'trillion',
     9 => 'billion',
     6 => 'million',
     3 => 'thousand'
    }

  number_to_words = ''

  illions.each do |base, word|
    base10 = 10**base
    # zillions
    zillions = number / base10
    number = number % base10

    if zillions > 0
      number_to_words += "#{to_words(zillions)} #{word} "
    end
  end
  
  # hundreds, this can't go in the zillions case cause I need to keep track of the remaining number to write
  hundreds = number/100
  remaining = number%100

  if hundreds > 0
    number_to_words += "#{to_words(hundreds)} hundred "
  end

  # Tens and units
  tenths = remaining/10
  units = remaining%10
  
  if tenths === 1  # Deals with the numbers between ten and nineteen
    number_to_words += teens_to_words[units]
  else
    if units === 0 || tenths === 0    # Not happy about this nested conditions
      number_to_words += tenths_to_words[tenths] # But I need them to see if I must include a dash
    else
      number_to_words += "#{tenths_to_words[tenths]}-"
    end
    number_to_words += units_to_words[units]
  end

  number_to_words.sub(/\s\s/) { ' ' } # Removes extra spaces

end

p to_words(100)
p to_words(0)
p to_words(10)
p to_words(11)
p to_words(12)
p to_words(22)
p to_words(25)
p to_words(2)
p to_words(42)
p to_words(98)
p to_words(20)
p to_words(999)
p to_words(1000)
p to_words(765)
p to_words(515)
p to_words(216)
p to_words(178)
p to_words(206)
p to_words(700)
p to_words(100)
p to_words(2000)
p to_words(300001)
p to_words(999999)
p to_words(999999999)
p to_words(12_345_567_999_000_333)
p to_words(12_345_567_999_000_310)
p to_words(11)

# This took me a while, I was seeing the repetition in the previous exercise, but didn't realize I needed
# some way to keep track of in what zillion the program is, I thought of stack recursion but couldn't figure
# out how to make it work, so I did this. I know is not the most effective solution cause it loops through
# the illions hash everytime it runs,  but at least iw works.