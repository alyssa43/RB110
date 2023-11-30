# PROBLEM:

	# - Write a method that determines and returns the ASCII string value of a string that is passed
  # - in as an argument. The ASCII string value is the sum of the ASCII values of every character 
  # - in the string. (You may use String#ord to determine the ASCII value of a character.)

	# - input: String
	# - outputs: Integer; representing the sum of the ASCII values of each character within input String

	# Rules:
		# Explicit requirements:
		# - return the sum of the ASCII values for each character within the input String
		# - can use `ord` to find the ASCII value

		# Implicit requirements:
		# - 

# Examples: 
  # - ascii_value('Four score') == 984
  # - ascii_value('Launch School') == 1251
  # - ascii_value('a') == 97
  # - ascii_value('') == 0

# Data Structure(s): 
  # - Array

# Algorithm: 

	# `ascii_value` method
	# =============================
		# - define a method called `ascii_value` that has one parameter called `string`
		# - separate all characters withiin `string` into an array
		# - transform each element to is ASCII value by invoking `ord` on each character
		# - calculate and return the sum of all the ASCII vslues

# Code:

def ascii_value(string)
	string.chars.map { |char| char.ord }.sum
end

char.ord.chr == char 
Returns the integer ordinal of the first character of self:

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0