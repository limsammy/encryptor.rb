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
  	input = File.open(filename, "r")
  	input.read
  	encrypted = encrypt(input.read, rotation)
  	output = File.open("sample.txt.encrypted", "w")
  	output.write(encrypted)
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

  def decrypt_file(filename, rotation)
  	#create file handle to read txt
  	input = File.open(filename, "r")
  	#read text
  	input.read
  	#decrypt text by passing params
  	decrypted = decrypt(input.read, rotation)
  	#create name for decrypted file
  	output_filename = filename.gsub("encrypted", "decrypted")
  	#create an output file handle
  	output = File.open(output_filename, 'w')
  	#write out that text
  	output.write(decrypted)
  	#close file
  	output.close
  end
end