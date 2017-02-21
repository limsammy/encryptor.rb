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