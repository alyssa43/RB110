# For a given nonempty string s find a minimum substring t and the maximum number k, 
# such that the entire string s is equal to t repeated k times.

# The input string consists of lowercase latin letters.

# Your function should return :

# a tuple (t, k) (in Python)
# an array [t, k] (in Ruby and JavaScript)
# in C, return k and write to the string t passed in parameter
# Examples:
# "ababab" ---> (t = "ab", k = 3)

# "abcde" ---> (t = "abcde", k = 1)
# because for this string, the minimum substring 't'
# such that 's' is 'k' times 't', is 's' itself.
=begin
problem: given a string (lowercase alphabetic characters), find the minimum string
that repeats within the input string. Return an array whose first element is the
minimum substring that is being repeated, and whose second element is the number of
times the substring is being repeated
  - input: string
  - output: array
  
  - rules:
    - input string will not be empty
    - input string will only contain lowercase letters

examples:
  - if input string is "ababab" the minimum string found is "ab", because it is repeated
  3 times we return ["ab", 3].
  - if input string is "abcde" we have no repeating characters which means the minimum
  substring would be the input itself, and it only occurs 1 time giving us a return value
  of ['abcde', 1]

data structure: 
  - starting: string
  - intermediate: string slices
  - ending: array

algorithm:
  - part one: slice input string into substrings
    - starting at first character of input string, slice a length of 1
  - part two: check if sliced substring * a multiple is equal to the input string
    - find the correct multiple
      - input strings size / sliced string size 
  - if sliced string multiplied by the multiplier is equal to the input string
    - return as an array 
      - the first element is the sliced string
      - the second element is the multiplier
=end

def f(str)
  1.upto(str.size) do |length|
    slice = str[0, length]
    multiplier = str.size / slice.size
    return [slice, multiplier] if slice * multiplier == str
  end
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

# completed on 3/6/2024 in 18 minutes