require 'socket'
require 'net/http'

pages = %w( www.rubycentral.com slashdot.org www.google.com )
threads = []
for page_to_fetch in pages
  threads << Thread.new(page_to_fetch) do |url|
    h = Net::HTTP.new(url, 80)
    puts "Fetching: #{url}"
    resp = h.get('/', nil)
    puts "Got #{url}: #{resp.message}"
  end
end
threads.each {|thr| thr.join}

begin
  client = TCPSocket.new("127.0.0.1", 80)
  client.send("GET\n", 0)
  puts client.readlines
ensure
  client.close unless client.nil?
end

h = Net::HTTP.new("baby.homeip.net", 80)
response = h.get("/patrick/");
if response.message == "OK"
  puts response.body.scan(/<img src="(.*?)"/m).uniq
end