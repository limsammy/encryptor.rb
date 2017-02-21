class Encryptor

 	def supported_characters
 		(' '..'z').to_a
 	end

	def cipher(rotation)
		rotated_characters = supported_characters.rotate(rotation)
		Hash[supported_characters.zip(rotated_characters)]
	end

	def encrypt_letter(letter, rotation)
		cipher_for_rotation = cipher(rotation)
		cipher_for_rotation[letter]
	end

 	def encrypt(string, rotation)
 		letters = string.split("")

 		letters.collect do |letter|
 			encrypt_letter(letter, rotation)
 		end.join()
 	end

 	def decrypt_letter(letter, rotation)
 		decipher = cipher(rotation).invert
 		decipher[letter]
 	end

 	def decrypt(string, rotation)
 		letters = string.split("")

 		letters.collect do |letter|
 			decrypt_letter(letter, rotation)
 		end.join()
 	end

 	# Outputing to text files
 	def encrypt_file(filename, rotation)
 		input = File.open(filename, "r")
 		message = input.read
 		encrypted_message = encrypt(message, rotation)
 		output_filename = filename.gsub(".txt", ".txt.encrypted")
 		output = File.open(output_filename, "w")
 		output.write(encrypted_message)
 		output.close
 	end

 	def decrypt_file(filename, rotation)
 		input = File.open(filename, "r")
 		message = input.read
 		decrypted_message = decrypt(message, rotation)
 		output_filename = filename.gsub("encrypted", "decrypted")
		output = File.open(output_filename, "w")
		output.write(decrypted_message)
		output.close
 	end

 	def crack(encrypted_message)
 		supported_characters.count.times.collect do |attempt|
 			decrypt(encrypted_message, attempt)
 		end
 	end
end