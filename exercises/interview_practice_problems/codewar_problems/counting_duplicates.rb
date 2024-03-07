# Write a function that will return the count of distinct case-insensitive 
# alphabetic characters and numeric digits that occur more than once in the 
# input string. The input string can be assumed to contain only alphabets 
# (both uppercase and lowercase) and numeric digits.

# Example
# "abcde" -> 0 # no characters repeats more than once
# "aabbcde" -> 2 # 'a' and 'b'
# "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
# "indivisibility" -> 1 # 'i' occurs six times
# "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
# "aA11" -> 2 # 'a' and '1'
# "ABBA" -> 2 # 'A' and 'B' each occur twice

=begin
problem: given a string return an integer that represents the amount of
alphabetic and numeric characters that occur more than once
  - input: string
  - output: integer
  - rules:
    - case is insensitive
      - 'A' and 'a' are considered the same character
    - input string will always only contain alphabetic and numeric characters
-examples:
 - if input is "abcde" we will return 0, because no characters occur more
   than once
  - if input is "abcdeaa" we will return 1, because 'a' occurs more than once
    but no other characters do
- data structure:
  - starting: string
  - intermediate: integer to count the amount of characters that occur more
  than once
  - ending: integer
- algorithm:
  - make a new string variable to reference the input string, in all lowercase
    characters as well as no repeating characters `clean_str`
  - make a new variable called `repeating_char_count` and assign it to reference `0`
    * this variable will be used to count repeating characters
  - iterate through the clean_str variable by character
    - count the amount of times the current character is within the input string
      - if it occurs more than once
        - increment the `repeating_char_count` variable by 1
  - return the `repeating_char_count` variable
=end

def duplicate_count(str)
  count = 0
  str.downcase.chars.uniq.each do |char|
    count += 1 if str.downcase.count(char) > 1
  end
  count


  # clean_string = string.downcase.chars.uniq.join
  # repeating_char_count = 0

  # clean_string.chars.each do |char|
  #   repeating_char_count += 1 if string.downcase.count(char) > 1
  # end

  # repeating_char_count
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

# completed on 3/6/2024 in 17 minutes