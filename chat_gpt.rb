require "ruby/openai" # https://github.com/alexrudall/ruby-openai
# usage:

# irb
# require_relative './chat_gpt'
# chat = ChatGPT.query # will run default query: What is the meaning of life?
# or pass it a parameter

class ChatGPT
  @output = ""
  def self.query(prompt = "What is the meaning of life?")
    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
    puts "Got OPENAI_API_KEY key. "
    response = client.completions(
      parameters: {
          model: "text-davinci-003",
          prompt: prompt,
          max_tokens: 2500
      })
    puts response["choices"].map { |c| c["text"] }
    @output = response["choices"].map { |c| c["text"] }
    response
  end

  def self.save(filename)
    File.write(filename,@output.first)
  end
end
