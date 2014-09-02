require 'json'
require 'benchmark'
require 'httparty'

THREAD_COUNT = 4
TEST_REQUEST_COUNTS = [1000, 10_000]

class TestServer
  include HTTParty
  format :json
end

Benchmark.bmbm do |x|
  TEST_REQUEST_COUNTS.each do |n|
    x.report("#{n} requests") do

      THREAD_COUNT.times.map do
        Thread.new do
          (n / THREAD_COUNT).times do
            TestServer.post('http://localhost:9292/echo', { body: { id: 'foo', test_size: n } })

            if n == 1000
              print '.'
            elsif n == 10_000
              print ':'
            else
              print 'x'
            end

          end
        end
      end.each(&:join)
    end
    sleep 5
  end
end