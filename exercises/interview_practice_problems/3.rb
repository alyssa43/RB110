# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

=begin
problem:given a string, return the same string that has been modified so that
every 2nd character in every 3rd word is coverted to uppercase. 
  - input: string
  - output: string

  - rules:
    - ONLY change the case of every 2nd character is every 3rd word
      * leave all other characters case as is
    - input string will contains multiple words, separated by a space
    - input string may have mixed cased characters

examples: 
  - if input is 'aaA bB c' we will return 'aaA bB c' because the third word
   which is 'c' only contains one character, so it does not get changed
  - if input is 'Loren Ipsum is simply dummy text of the printing'. every 3rd
  word would be 'is', 'text', and 'printing'. so then we change every 2nd 
  character of those words leaving us with 'iS', 'tExT', and 'pRiNtInG'

data structure:
  - starting: string
  - intermediate: array where each element is a word from input string
  - ending: string

algorithm:
  - separate input string into an array where each element is a word
  - select every 3rd word from word array
    - transform the selected words
      - decompose word into characters
        - transform odd indexed characters into uppercase character
      - join characters back together
  - join together transformed words into a string
=end

def to_weird_case(string)
  words = string.split
  words.unshift('X')
  words = words.map.with_index do |word, word_index|
    next word if word_index % 3 != 0
    chars = word.chars
    chars.map.with_index do |char, char_index|
      char_index.odd? ? char.upcase! : char
    end
    chars.join
  end
  words[1..-1].join(' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".

# Completed on 3/5/24 in 25 minutes