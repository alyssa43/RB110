# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

=begin
problem: given a string, return the character that occurs the least amount of times AND that occurs first in the input string.
  - input: String
  - outout: string (single character)

  - rules :
    - output string character will always be lowercase
    - uppercase and lowercase letters count as the same character
    - spaces and punctuation also count as characters
    - if a character occurs the same amount of time as another character, return the character that appeared first in the input String

Examples:
  - if input is "Hello World" we can see that "H" occurs 1 time. "e" occurs 1 time. 'l' occurs 3 times. 'o' occurs 2 times, 'W' occurs 1 time, 'r' occurs 1 time, and 'd' occurs 1 time. So we return 'h' because it only occurs once and is the first character in the String

data structure:
  - starting: string
  - intermediate: 
    - maybe an array of all the character from input string
    - maybe a hash that counts each character
  - ending: string (single character)

algorithm:
  version 1:
    - make all characters lowercase
    - iterate over all the characters in input String
      - create a hash where each character is a key, and the value increments for each occurrence of the Key
    - select the keys with the lowest value
    - return the first key

  version 2:
  - make all characters lowercase
    - create a variable to hold the value of the least amount of occurrences and assign it to 1
    - iterate through input String by each character
      - count the occurrences of current character
        - if amount of occurrences is equal to least amount of occurrences
          - return character
        - otherwise go to next character
        - if current character is the last character and nothing has been returned
          - increment least amount of occurrences by 1
=end

# version 1
def least_common_char(str)
  char_count = str.downcase.chars.each_with_object(Hash.new(0)) do |char, hsh|
    hsh[char] += 1
  end
  char_count.select! { |char, count| count == char_count.values.min }
  char_count.keys.first
end

# version 2
def least_common_char(str)
  occurrences = 1
  loop do 
    str.downcase.chars.each do |char|
      return char if str.downcase.count(char) == occurrences
    end
    occurrences += 1
  end  
end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".

# Completed 3/5/24
  # version 1 - 25 minutes
  # version 2 add on - 10 minutes