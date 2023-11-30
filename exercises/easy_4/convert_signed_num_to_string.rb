# PROBLEM:

	# - In the previous exercise, you developed a method that converts non-negative numbers to strings.
	# - In this exercise, you're going to extend that method by adding the ability to represent negative 
	# - numbers as well.

	# - Write a method that takes an integer, and converts it to a string representation.

	# - You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), 
  # - Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

	# - input: an Integer 
	# - outputs: a String representation of input Integer

	# Rules:
		# Explicit requirements:
		# - input Integer may be positive, negative, or zero
		# - cannot use any built-in conversion methods
		# - can use `inter_to_string` method from previous exercise

		# Implicit requirements:
		# - 

# Examples: 
  # - signed_integer_to_string(4321) == '+4321'
  # - signed_integer_to_string(-123) == '-123'
  # - signed_integer_to_string(0) == '0'

# Data Structure(s): 
  # - ternary operator

# Algorithm: 

	# `signed_integer_to_string` method
	# ==================================
		# - define a method called `signed_integer_to_string` that has one parameter called `integer`
		# - initialize a local variable called `result` that referneces the return value of invoking..
		  # - ..`integer_to_string` with `integer` as the argument
		# - return `result` if `integer` is equal to `0`
		# - check to see if `integer` is positive; if so return `result` with '+' prepended
		# - if `integer` is negative; return `result` with '-' prepended

# Code:

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  integer.digits.reverse.map { |num| DIGITS[num] }.join
end

def signed_integer_to_string(integer)
	result = integer_to_string(integer.abs)
	return result if integer.zero?
  integer.positive? ? result.prepend('+') : result.prepend('-')
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
