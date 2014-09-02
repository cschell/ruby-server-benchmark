require 'json'
require 'benchmark'
require 'httparty'

class TestServer
  include HTTParty
  format :json
end


n = 10


Benchmark.bm do |x|
  3.times do
    n *= 10
    x.report("#{n} requests") do
      n.times.map do

        Thread.new {
          params = {
            body: {
              id: 'foo'
            }.to_json
          }

          TestServer.post('http://localhost:9292/echo', params)
        }

      end.each(&:join)
    end
  end
end