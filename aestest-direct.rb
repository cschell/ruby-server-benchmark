require 'openssl'


def bin2hex bin
  bin.each_byte.map { |b| b.to_s(16).rjust(2,'0') }.join
end


cipher = OpenSSL::Cipher::AES256.new(:CBC)
cipher.encrypt
key = cipher.random_key

(1..100000).each do |i|
  number = i.to_s.rjust(5,'0')
  id = "foo-#{number}"
  #puts "id:"
  #puts id
  hashed_id = Digest::MD5.digest(id)
  #puts "hashed_id:"
  #puts bin2hex(hashed_id)
  iv = cipher.random_iv
  encrypted_hashed_id = iv + "--" + cipher.update(hashed_id) + cipher.final
  #puts "encrypted_hashed_id:"
  #puts bin2hex(encrypted_hashed_id)
  encrypted_hashed_id
end
