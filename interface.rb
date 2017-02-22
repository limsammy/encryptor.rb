require './encryptor'
require 'digest/md5'

@e = Encryptor.new

#password = samuel123 encrypted w rotation of 33 = > 9'3;+2RST
#md5hexdigest = "5cf8376f80b723d609ae142afad77ce3"
PASSWORD = "5cf8376f80b723d609ae142afad77ce3"


def check_access
	print("Please enter the password > ")
	guess_attempt = @e.encrypt(gets.chomp, 33)
	puts guess_attempt
	guess_md5 = Digest::MD5.hexdigest(guess_attempt)
	puts guess_md5
	if guess_md5 == PASSWORD
		puts "Authorized!"
		authed()
	else
		puts("Auth failed.")
		check_access()
	end
end

def authed
	loop do
		print("Would you like to (e) encrypt or (d) decrypt a message? Type (q) to quit > ")
		input = gets.chomp.to_s
		if input == 'e'
			print("Enter a string to encrypt > ")
			string = gets.chomp.to_s
			print("Enter a rotation to encrypt with > ")
			rotation = gets.chomp.to_i
			output = @e.encrypt(string, rotation)
			puts("Your encrypted message is #{output}")
		elsif input == 'd'
			print("Enter a string to decrypt > ")
			string = gets.to_s
			print("Enter rotation key > ")
			rotation = gets.to_i
			output = @e.decrypt(string, rotation)
			puts("Your decrypted message is #{output}")
		elsif input == 'q'
			puts "Quitting in 3, 2, 1..."
			break
		else
			puts "Invalid command, try again next iteration!"
		end		
	end
end

check_access()