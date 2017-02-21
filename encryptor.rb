class Encryptor
  def cipher
    {'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q',
     'e' => 'r', 'f' => 's', 'g' => 't', 'h' => 'u',
     'i' => 'v', 'j' => 'w', 'k' => 'x', 'l' => 'y',
     'm' => 'z', 'n' => 'a', 'o' => 'b', 'p' => 'c',
     'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g',
     'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k',
     'y' => 'l', 'z' => 'm'}
  end

  def encrypt_letter(letter)
  	lowercase_letter = letter.downcase
  	cipher[lowercase_letter]
  end

  def encrypt(string)
  	# cut string into letters array
  	letters = string.split("")

  	# encrypt letters one at a time, add encrypted letter to results array
  	results = letters.collect do |letter|
  		encrypt_letter = encrypt_letter(letter)
  	end

  	# join the results into one, fully encrypted, string
  	results.join
  end

  def decrypt_letter(letter)
  	lowercase_letter = letter.downcase
  	reversed_cipher = cipher.to_a.reverse.to_h
  	reversed_cipher[lowercase_letter]
  end

  def decrypt(string)
  	letters = string.split("")

  	results = letters.collect do |letter|
  		decrypt_letter = decrypt_letter(letter)
  	end

  	results.join
  end
end