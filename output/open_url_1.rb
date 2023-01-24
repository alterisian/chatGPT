# Prompt: ChatGPT.query("Write some ruby that downloads the first 1k at a url and catches exceptions that occur")
require 'open-uri'

def url_reader(url, output)
  begin
    open('url', 'r') do |f|
      File.open('file_name', 'w') do |file|
        file.puts f.read(1024)
      end
    end
  rescue Exception => e
    puts e.message
  end
end
