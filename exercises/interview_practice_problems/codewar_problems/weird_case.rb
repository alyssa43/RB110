# Write a function that accepts a string, and returns the same string with all 
# even indexed characters in each word upper cased, and all odd indexed characters 
# in each word lower cased. The indexing just explained is zero based, so the 
#   zero-ith index is even, therefore that character should be upper cased and you 
#   need to start over for each word.

# The passed in string will only consist of alphabetical characters and spaces(' '). 
# Spaces will only be present if there are multiple words. Words will be separated by 
# a single space(' ').

# Examples:
# "String" => "StRiNg"
# "Weird string case" => "WeIrD StRiNg CaSe"

=begin
problem: given a string, return a transformed string where each WORDS even indexed
characters are uppercase and each odd indexed characters are lowercase
  - input: string
  - output: string

  - rules:
    - each word has its own indexes
    - multiple words will be separated by a single space
    - input string may contains upper or lowercase characters

example:
  - if input is 'hello world' we would return 'HeLlO WoRlD'

data structure:
  - starting: string
  - intermediate: split the input string into an array of words
  -ending: string

algorithm:
  - create a new array variable called `words` whose elements are each word of 
    input string
  - iterate through the `words` array
    - transform each word by character
      - break down the current word into an array of characters 
        - if the characters index is even then transform it to uppercase
        - if the characters index is odd then transform it to lowercase
      - join characters back together to form word
    - join words back together to for a string
  - return that string
=end

def weirdcase(string)
  words = string.split
  words.map do |word|
    word.chars.map.with_index do |char, i|
      i.even? ? char.upcase : char.downcase
    end.join
  end.join(' ')
end

p weirdcase('This') == 'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') == 'ThIs Is A TeSt'

# completed on 3/7/2024 in 12 minutes
