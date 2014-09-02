require 'httparty'

(1..1000).each do |i|
  number = i.to_s.rjust(5,'0')
  data = {id: "foo-#{number}"}

  response = HTTParty.post('http://localhost:4567/encrypt',
    body: {id: "foo"}.to_json,
    headers: { 'Content-Type' => 'application/json' } )
end

