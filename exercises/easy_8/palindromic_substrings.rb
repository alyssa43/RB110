# Write a method that returns a list of all substrings of a string that are 
# palindromic. That is, each substring must consist of the same sequence of 
# characters forwards as it does backwards. The return value should be arranged 
# in the same sequence as the substrings appear in the string. Duplicate 
#   palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous 
# exercise.

# For the purposes of this exercise, you should consider all characters and pay 
# attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor 
# "Abc-bA" are. In addition, assume that single characters are not palindromes.

# Examples:
# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

def leading_substrings(str)
  str.chars.map.with_index { |_, i| (str.chars[0..i]).join }
end

def substrings(str)
  result = []
  str.chars.each_index { |i| result << leading_substrings(str[i..-1]) }
  result.flatten
end

def palindromes(str)
  substrings(str).select do |substring|
    substring.length >= 2 && substring == substring.reverse
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]