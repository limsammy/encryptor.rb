require './encryptor'
require 'digest/md5'

@e = Encryptor.new

#password = samuel123 encrypted w rotations of 33, 32, 31 = > 7%19)0PQR
#md5hexdigest = "b78fe1479898047853bcd994e3c0c7e0"
PASSWORD = "b78fe1479898047853bcd994e3c0c7e0"


def check_access
	print("Please enter the password > ")
	guess_attempt = @e.encrypt(gets.chomp, 33, 32, 31)
	guess_md5 = Digest::MD5.hexdigest(guess_attempt)
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
			print("Enter first rotation to encrypt with > ")
			rotation1 = gets.chomp.to_i
			print("Enter second rotation to encrypt with > ")
			rotation2 = gets.chomp.to_i
			print("Enter third rotation to encrypt with > ")
			rotation3 = gets.chomp.to_i
			output = @e.encrypt(string, rotation1, rotation2, rotation3)
			puts("Your encrypted message is #{output}")
		elsif input == 'd'
			print("Enter a string to decrypt > ")
			string = gets.to_s
			print("Enter first rotation key > ")
			rotation1 = gets.to_i
			print("Enter second rotation key > ")
			rotation2 = gets.to_i
			print("Enter third rotation key > ")
			rotation3 = gets.to_i
			output = @e.decrypt(string, rotation1, rotation2, rotation3)
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