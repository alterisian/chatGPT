# Prompt: ChatGPT.query("Write some ruby that downloads the first 1k at a url, catches exceptions that occur, and outputs the contents as a string")

require 'net/http'
require 'open-uri'

begin
  uri = open('http://example.com/') # replace example.com with your URL
  result = Net::HTTP.get_response(uri)
  data = result.body
  result = data.slice!(0..1000) # get first 1k characters
rescue
  puts "An error occurred while fetching your data." # handle exceptions
end

puts result.to_s # output contents as string
