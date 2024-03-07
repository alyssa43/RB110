=begin
problem: given a string that contains string numbers, find all the substrings. Return the
number of odd substrings.
  - input: string
  - output: integer
  - rules: 
    - if a number occurrs more than once, count all instances - if odd
    - substrings are character of the input string that are adjacent to other characters
examples:
  - if input is "1341" all of the substrings formed would be: "1", "13", "134", "1341",
  "3", "34", "341", "4", "41", and "1". if we convert these strings to integers, the odd
  numbered substrings would be 1, 13, 1341, 3, 341, 41, 1. Because there are 7 odd numbered
  integers we would return `7`.
data structure:
  - starting: string
  - intermediate: array of substrings
  - ending: integer
algorithm:
- part one: find all substrings
  - create a variable that will hold all substrings, assign it to reference an empty array
  - iterate through input string characters using index
    - create an inner iterator that will represent the length of substring to be sliced
    - slice substring and append it to the substrings array variable
- part two: select all odd numbered string numbers
  - using #select! modify the substrings array to only reference odd numbered string numbers
- part three: return amount of elements inside substrings array
=end

def solve(s) 
  substrings = []
  s.chars.each_index do |index|
    1.upto(s.size - index) do |length|
      substrings << s[index, length]
    end
  end
  substrings.select { |str_num| str_num.to_i.odd? }.size
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

# completed on 3/6/2024 in 20 minutes