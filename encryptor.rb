class Encryptor

 	def supported_characters
 		(' '..'z').to_a
 	end

	def cipher(rotation)
		rotated_characters = supported_characters.rotate(rotation)
		Hash[supported_characters.zip(rotated_characters)]
	end

	def encrypt_letter(letter, rotation1, rotation2, rotation3)
		cipher_for_rotation1 = cipher(rotation1)
		cipher_for_rotation1[letter]
		cipher_for_rotation2 = cipher(rotation2)
		cipher_for_rotation2[letter]
		cipher_for_rotation3 = cipher(rotation3)
		cipher_for_rotation3[letter]
	end

 	def encrypt(string, rotation1, rotation2, rotation3)
 		letters = string.split("")

 		letters.collect do |letter|
 			encrypt_letter(letter, rotation1, rotation2, rotation3)
 		end.join()
 	end

 	def decrypt_letter(letter, rotation1, rotation2, rotation3)
 		decipher1 = cipher(rotation1).invert
 		decipher1[letter]
 		decipher2 = cipher(rotation2).invert
 		decipher2[letter]
 		decipher3 = cipher(rotation3).invert
 		decipher3[letter]
 	end

 	def decrypt(string, rotation1, rotation2, rotation3)
 		letters = string.split("")

 		letters.collect do |letter|
 			decrypt_letter(letter, rotation1, rotation2, rotation3)
 		end.join()
 	end

 	# Outputing to text files
 	def encrypt_file(filename, rotation1, rotation2, rotation3)
 		input = File.open(filename, "r")
 		message = input.read
 		encrypted_message = encrypt(message, rotation1, rotation2, rotation3)
 		output_filename = filename.gsub(".txt", ".txt.encrypted")
 		output = File.open(output_filename, "w")
 		output.write(encrypted_message)
 		output.close
 	end

 	def decrypt_file(filename, rotation1, rotation2, rotation3)
 		input = File.open(filename, "r")
 		message = input.read
 		decrypted_message = decrypt(message, rotation1, rotation2, rotation3)
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
