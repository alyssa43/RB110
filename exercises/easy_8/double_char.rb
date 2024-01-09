# Write a method that takes a string, and returns a new string in which every character is doubled.

# Examples:
# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''

def repeater(str)
  str.chars.map { |char| char * 2 }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''