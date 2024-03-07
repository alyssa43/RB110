# Complete the function scramble(str1, str2) that returns true if a portion of 
# str1 characters can be rearranged to match str2, otherwise returns false.

# Notes:

# Only lower case letters will be used (a-z). No punctuation or digits will 
# be included.
# Performance needs to be considered.
# Examples
# scramble('rkqodlw', 'world') ==> True
# scramble('cedewaraaossoqqyt', 'codewars') ==> True
# scramble('katas', 'steak') ==> False

=begin
problem: given two strings, return true if the first input string contains
all of the same characters as the second input string. Otherwise return false

  - input:
    - string
    - string
  - output: boolean

  - rules:
    - only lowercase letters will be used
    - letters do not need to be in same order to be a character match

examples:
  - if inputs are "rkqodlw" and "world", we want to check to make sure the
  first input string of "rkqodlw" contains all the characters from the 
  second input string of "world". So first we will check the 'w', which we
  can see is within the first input string, then check 'o' which we can see
  is also within the first input string, and so on. Because all characters
  are within first input string we would return `true`

data structures:
  - starting: string
  - intermediate: may consider using an array of characters
  - ending: boolean

algorithm:
  - iterate through the second input string by character
    - if the current character is NOT included in the first input string
      - return false
    - otherwise do nothing
  - if all characters have been iterated through without a false return
    - return true
=end

def scramble(s1, s2)
  s2.chars.all? { |char| s1.include?(char) }
end


p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

# Completed on 3/6/2024 in 8 minutes
