class Encryptor
  def cipher(rotation)
  	characters = (' '..'z').to_a
  	rotated_characters = characters.rotate(rotation)
  	Hash[characters.zip(rotated_characters)]
  end

  def encrypt_letter(letter, rotation)
  	cipher_for_rotation = cipher(rotation)
  	cipher_for_rotation[letter]
  end

  def encrypt(string, rotation)
  	letters = string.split("")

  	results = letters.collect do |letter|
  		encrypt_letter = encrypt_letter(letter, rotation)
  	end

  	results.join
  end

  def encrypt_file(filename, rotation)
  	#create file handle to the input file
  	input = File.open(filename, "r")
  	#read the text of in the input file
  	input.read
  	#create a name for the output file
  	encrypted = encrypt(input.read, rotation)
  	#create an ouput file handle
  	output = File.open("sample.txt.encrypted", "w")
  	#write out the text
  	output.write(encrypted)
  	#close the file
  	output.close
  end

  def decrypt_letter(letter, rotation)
  	cipher_for_rotation = cipher(rotation)
  	cipher_for_rotation.key(letter)
  end

  def decrypt(string, rotation)
  	letters = string.split("")

  	results = letters.collect do |letter|
  		decrypt_letter = decrypt_letter(letter, rotation)
  	end

  	results.join
  end
end