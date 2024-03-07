require 'pry'
=begin
problem: given a LOWERCASE string (that only contains alphabetic characters), return an 
integer that is equal to the amount of characters in the longest chain on vowel substring
  - input: string
  - output: integer
  - rules:
    - input string will only be lowercase
    - input string will only be alphabetic characters
    - vowels are aeiou
-example:
  - if input is "codewarriors" our vowel substrings are 'o', 'e', 'a', and 'io' so we will
  return `2` because that is the amount of characters in the longest vowel substring
- data structures:
  - starting: string
    - intermediate: array of vowel substrings
  - ending: integer
- algorithm:
  - scan input string for occurrences of vowel substrings
    - returns an array of vowel substrings
  - sort the vowel substring by substring length
  - return the size of the largest substring
=end

# First solution
def solve(s)
  vowel_substrings = s.scan(/[aeiou]+/)
  vowel_substrings.max_by(&:length).size
end

# Second solution
# Want to re-do without using regex

VOWELS = %w(a e i o u)

def vowel?(char)
  VOWELS.include?(char)
end

def solve(str)
  longest_chain = 0
  current_chain = 0
  str.chars.each do |char, i|
    current_chain = vowel?(char) ? current_chain + 1 : 0

    longest_chain = current_chain if longest_chain < current_chain
  end
  longest_chain
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

# completed on 3/6/2024 in 15 minutes