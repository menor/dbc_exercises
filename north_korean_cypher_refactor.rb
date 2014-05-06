class Encryptor

  def initialize(key=4)
    @key = key
    @alphabet = Array('a'..'z')
    @cipher = Hash[@alphabet.zip(@alphabet.rotate(@key))]
    # Combines the alphabet with a rotated alphabet in a Hash
  end

  def decrypt(message)
    decrypted_message = message.gsub(/[@\#\$\%^&*]/, " ") # takes care of the spaces
    decrypted_message = decrypted_message.gsub(/\d+/) {|number| number.to_i / 100} # same with the numbers
    decrypted_message.gsub(/[a-zA-Z]+/) {|word| word_decryptor(word)} # Sends words to decryptor
  end
  
  def encrypt(message)
    encrypted_message = message.gsub(/\s/) {|space| space = ["@","#","$","%","^","&","*"].sample} # Spaces
    encrypted_message = encrypted_message.gsub(/\d+/) {|number| number.to_i * 100} # Numbers
    encrypted_message = encrypted_message.gsub(/[a-zA-Z]+/) {|word| word_encryptor(word)} # Words
  end

  private

  def word_encryptor(word)
    word.downcase.split('').collect { |letter| @cipher[letter]}.join('').reverse
  end
  
  def word_decryptor(word)
    word.downcase.split('').collect { |letter| @cipher.key(letter)}.join('').reverse
  end

end

######### TESTS 
north_korean = Encryptor.new
# These should throw errors
# p north_korean.cipher
# p north_korean.key

p north_korean.encrypt("I want a Coke!")
p north_korean.decrypt("m^xrea%e&iosg!") == "i want a coke!"
p north_korean.decrypt("vys@iptsit&xei#ilx#xwsq&wysmgmpih%hre$wysmxmvxyr^whssj#qsvj@vys@1000000$ipfexmjsvt*wqvej.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean.decrypt("vys$wioyr@ive%hpil*vilxiksx@cf#itevk-hivszepj#iijjsx.%rsh'x@ppix*ilx*wy!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"

spaniard = Encryptor.new(12)
p spaniard.decrypt("qdqtf'e$iaze^zu*fzume*lfuday") == "there's snow in saint moritz"

