require './encryptor'

@e = Encryptor.new

def authed
	loop do
		print("Would you like to (1) encrypt or (2) decrypt a message? > ")
		input = gets.to_i
		if input == 1
			print("Enter a string to encrypt > ")
			string = gets.chompto_s
			print("Enter a rotation to encrypt with > ")
			rotation = gets.chomp.to_i
			output = e.encrypt(string, rotation)
			puts("Your encrypted message is #{output}")
		elsif input == 2
			print("Enter a string to decrypt > ")
			string = gets.to_s
			print("Enter rotation key > ")
			rotation = gets.to_i
			output = e.decrypt(string, rotation)
			puts("Your decrypted message is #{output}")
		else
			puts("Invalid...")
		end		
	end
end

authed()