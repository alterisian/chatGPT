
# Answer: 
def self.write_tests_that(prompt="write the tests in rspec for FizzBuzz")
describe 'FizzBuzz' do
  it 'returns "Fizz" when passed a multiple of 3' do
    expect(fizzbuzz(3)).to eq 'Fizz'
  end

  it 'returns "Buzz" when passed a multiple of 5' do
    expect(fizzbuzz(5)).to eq 'Buzz'
  end

  it 'returns "FizzBuzz" when passed a multiple of 3 and 5' do
    expect(fizzbuzz(15)).to eq 'FizzBuzz'
  end

  it 'returns the same number when passed a number that is not a multiple' do
    expect(fizzbuzz(1)).to eq 1
  end
end
end

def self.write_implementation_that_passes_these_tests(url)
  def fizzbuzz(num)
  if num % 3 == 0 && num % 5 == 0
    "FizzBuzz"
  elsif num % 5 == 0
    "Buzz"
  elsif num % 3 == 0
    "Fizz"
  else
    num
  end
end
end

def self.commit_code
  system("git init")
  system("git add .")
  system("git commit -m 'adding FizzBuzz tests'")
end

def def.execute_rspec_tests
  system("rspec tests.rspec")
end