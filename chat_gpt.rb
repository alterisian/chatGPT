# usage:
# get api key: https://beta.openai.com/account/api-keys
# save to environment variable - maybe with direnv in .envrc: OPENAI_API_KEY

# if you do not have ruby, install it: https://www.ruby-lang.org/en/documentation/installation
# if you do not have bundler to install gems, install it: https://github.com/rubygems/rubygems/tree/master/bundler

# bundle install

# from this directory run the interactive ruby interpreter:
# irb

# require_relative './chat_gpt'
# chat = ChatGPT.query # will run default query: What is the meaning of life?
# or pass it a parameter
# Perhaps you want to save the output of the query to the output directory?
# chat.save(filename)

# see TODOs for ideas on whats next....
require "ruby/openai" # https://github.com/alexrudall/ruby-openai

require 'net/http'    # included for file download-TODO move to specialised class
require 'open-uri'    # included for file download-TODO move to specialised class
require "down"        # https://github.com/janko/down

class ChatGPT
  ONE_MEG = 1*1024*1024
  @output = ""

  def self.query(prompt = "What is the meaning of life?")
    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
    puts "Created OpenAI client. "
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
    File.write("./output/" + filename, @output.first) unless filename.length > 30
  end

  # DO_NOT_MODIFY to have user / ai entered parameters
  def self.run_tests
    results = system("rspec output")
    puts results
    results
  end

  def self.query_about_url(url, prompt = "what is wrong with this: ")
    filename = self.get_content_from_url url
    puts "using temporary file: #{filename}"
    content = File.open("./temp_files/"+filename).read
    prompt = "#{prompt} #{content}"
    self.query prompt
  end

  # get just 1Kb from a url
  # 5Mb=5 * 1024 * 1024
  def self.get_content_from_url(url)
    # specifying destination means we loose the Tempfile
    Down.download(url, max_size: ChatGPT::ONE_MEG, destination: "./temp_files")
    filename = Dir.entries("./temp_files").last

    filename
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

# TODO is each conversation a project?
# TODO if we want to refine the previous output, should it be uploaded as a file?
#  - look into client.files.upload and client.finetunes.create at https://github.com/alexrudall/ruby-openai
