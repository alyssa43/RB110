# A pangram is a sentence that contains every single letter of the alphabet at 
# least once. For example, the sentence "The quick brown fox jumps over the 
# lazy dog" is a pangram, because it uses the letters A-Z at least once (case 
# is irrelevant).

# Given a string, detect whether or not it is a pangram. Return True if it is, 
# False if not. Ignore numbers and punctuation.

=begin
problem: given a string, return true if input string contains at least one
occurrences of every alphabetic letter; false otherwise

  - input: string
  - output: boolean

  - rules: 
    - case does not matter - 'A' and 'a' will both be counted as same letter
    - ignore numbes and punctuation

data structure:
  - starting: string
  - intermediate: hash that counts each alphabetic character
  - ending: boolean

algorithm:
  - remove all characters that are not alphabetic
  - transform all remaining characters to lowercase
  - create a hash whose keys will be an alphabetic character and whose values
    will begin at `0`
  - iterate through clean string characters
    - increment each occurrence of each character within the hash
  - check to see if all values within hash are greater than 0
    - reutrn true if thall values are greater than 0; false otherwise
=end

def pangram?(string)
  clean_string = string.gsub(/[^a-zA-Z]/, '').downcase
  char_count = ('a'..'z').to_a.each_with_object({}) do |char, hsh|
    hsh[char] = 0
  end
  clean_string.chars.each do |char|
    char_count[char] += 1
  end
  char_count.values.all? { |value| value > 0 }
end

p pangram?("The quick brown fox jumps over the lazy dog.")  == true
p pangram?("This is not a pangram.") == false


# Completed on 3/6/2024 in 12 minutes