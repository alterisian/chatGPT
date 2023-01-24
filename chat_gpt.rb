require "ruby/openai" # https://github.com/alexrudall/ruby-openai
# usage:
# get api key: https://beta.openai.com/account/api-keys
# save to environment variable: OPENAI_API_KEY

# if you do not have ruby, install it: https://www.ruby-lang.org/en/documentation/installation
# if you do not have bundler to install gems, install it: https://github.com/rubygems/rubygems/tree/master/bundler

# from this directory run the interactive ruby interpreter:
# irb

# require_relative './chat_gpt'
# chat = ChatGPT.query # will run default query: What is the meaning of life?
# or pass it a parameter
# Perhaps you want to save the output of the query?
# chat.save(filename)

# see TODOs for ideas on whats next.... 

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

  def self.query_about_url(url, prompt = "what is wrong with this: ")
    content = self.get_content_from_url url
    prompt = prompt + content
    self.query prompt
  end

  def self.get_content_from_url(url)
    # retrieve the first 1k at a url
    content = ""
  end

  # TODO def self.write_tests_that(prompt="write the tests in rspec for FizzBuzz")
  # end

  # TODO def self.write_implementation_that_passes_these_tests(url)
  # end

  # TODO def self.commit_code
  # commiting code so a sandbox can execute the tests feels safer, right?
  # end

  # DONOTDO def def.execute_code
  #  do not EVER do this
  # end

  # TODO consider def.executute_rspec_tests
  # end
end
