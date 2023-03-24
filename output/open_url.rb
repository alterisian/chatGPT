# Prompt: ChatGPT.query("Write some ruby that downloads the first 1k at a url, catches exceptions that occur, and outputs the contents as a string")

require 'net/http'
require 'open-uri'

def retrieve_url(url)
  begin
    uri = open( url, 'rb' )
    result = Net::HTTP.get(uri)
    data = result.body
    result = data.slice!(0..1000) # get first 1k characters
    puts result.to_s
  rescue
    puts "An error occurred while fetching your data."
  end

  result
end
