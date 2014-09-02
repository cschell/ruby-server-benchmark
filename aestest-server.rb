require 'pp'

directory '.'
environment 'production'
daemonize false

app do |env, test|
  # reuqest_body = request.body.read
  # body = JSON.parse reuqest_body
  # id = body["id"]
  params = Rack::Request.new(env).params
  

  # body = params["id"]
  if params['test_size'] == '1000'
    print '.'
  elsif params['test_size'] == '10000'
    print ':'
  else
    print 'x'
  end

  body = "-"
  [200, { 'Content-Type' => 'text/plain', 'Content-Length' => body.length.to_s }, [body]]
end


# require 'sinatra'
# require 'openssl'
# require 'json'

# set :logging, false

# cipher = OpenSSL::Cipher::AES256.new(:CBC)
# cipher.encrypt
# key = cipher.random_key

# post '/echo' do
#   reuqest_body = request.body.read
#   #puts "reuqest_body:"
#   #puts reuqest_body
#   body = JSON.parse reuqest_body
#   id = body["id"]
#   #puts "id:"
#   #puts id
#   id
# end

# post '/encrypt' do
#   reuqest_body = request.body.read
#   #puts "reuqest_body:"
#   #puts reuqest_body
#   body = JSON.parse reuqest_body
#   id = body["id"]
#   #puts "id:"
#   #puts id
#   hashed_id = Digest::MD5.digest(id)
#   #puts "hashed_id:"
#   #puts bin2hex(hashed_id)
#   iv = cipher.random_iv
#   encrypted_hashed_id = iv + "--" + cipher.update(hashed_id) + cipher.final
#   #puts "encrypted_hashed_id:"
#   #puts bin2hex(encrypted_hashed_id)
#   encrypted_hashed_id
# end


# def bin2hex bin
#   bin.each_byte.map { |b| b.to_s(16).rjust(2,'0') }.join
# end