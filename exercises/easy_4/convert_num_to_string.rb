# PROBLEM:

	# - Write a method that takes a positive integer or zero, and converts it to a string representation.

  # - You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, 
	# - String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the
	# - string by analyzing and manipulating the number.

	# - input: an Integer; either positive or zero
	# - outputs: a String representation of the input Integer

	# Rules:
		# Explicit requirements:
		# - input Integer will either be positive or zero
		# - may not use any built-in conversion methods

		# Implicit requirements:
		# - 

# Examples: 
  # - integer_to_string(4321) == '4321'
  # - integer_to_string(0) == '0'
  # - integer_to_string(5000) == '5000'

# Data Structure(s): 
  # - Hash

# Algorithm: 

	# `integer_to_string` method
	# =============================
		# - initialize a constant variable called `DIGITS` that references a hash converting each num to it's string representation
		# - define a method called `integer_to_string`, that has one parameter called `integer`
		# - convert `integer` to an Array, and iterate through said Array using `map`, that has one parameter called `num`
			# - return the value of `num`s string representation
		# - use `join` to combine each element on returned Array.

# Code:

DIGITS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(integer)
  integer.digits.reverse.map { |num| DIGITS[num] }.join
end


p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'