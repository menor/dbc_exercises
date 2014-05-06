def north_korean_decipher(cypher_message, key=4)
  key = 4 if key > 25 || key < 1 # Prevents keys from going out of range(Not the most elegant solution I know)
  cypher_message = cypher_message.gsub(/[@\#\$\%^&*]/, " ") # takes care of the spaces
  cypher_message = cypher_message.gsub(/\d+/) {|number| number.to_i / 100} # same with the numbers
  cypher_message.gsub(/\w+/) {|word| decipher_word(word, key)} # Sends words to decypher
end

def decipher_word(word, key)
  decipher = []
  word.downcase.each_byte do |ascii| # Turns each character into its ascii code
    if (96..122).include?(ascii)
      ascii > (96 + key) ? ascii -= key : ascii += (26 - key)
    end
    decipher.push(ascii.chr) # returns the corresponding char to the manipulated ascii code
  end
  decipher.join
end

#### cypher methods below

def north_korean_cipher(message, key=4)
  key = 4 if key > 25 || key < 1
  message = message.gsub(/\s/) {|space| space = ["@","#","$","%","^","&","*"].sample} # Spaces
  message = message.gsub(/\d+/) {|number| number.to_i * 100} # Numbers
  message = message.gsub(/\w+/) {|word| cipher_word(word, key)} # Words
end

def cipher_word(word, key=4)
  cipher = []
  word.downcase.each_byte do |ascii|
    if (96..122).include?(ascii)
      ascii < (122 - key) ? ascii += key : ascii -= (26 - key)
    end
    cipher.push(ascii.chr)
  end
  cipher.join
end


######### TESTS 
p north_korean_decipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_decipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_decipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!")
p north_korean_decipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.")
p north_korean_decipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!")
p north_korean_decipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?")

puts north_korean_decipher("xlivi'w*wrsa*mr^wemrx^qsvmxd") == "there's snow in saint moritz"
puts north_korean_decipher("uifsf't&topx@jo$tbjou#npsjua", 1) == "there's snow in saint moritz"
puts north_korean_decipher("iwtgt'h%hcdl#xc$hpxci%bdgxio", 15) == "there's snow in saint moritz"
puts north_korean_decipher("xlivi'w$wrsa#mr$wemrx&qsvmxd", 36) == "there's snow in saint moritz"

