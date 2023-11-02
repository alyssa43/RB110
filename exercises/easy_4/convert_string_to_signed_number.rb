# PROBLEM:

	# Write a method that takes a String of digits, and returns the appropriate number as an integer.
	# The String may have a leading + or - sign; if the first character is a +, your method should 
	# return a positive number; if it is a -, your method should return a negative number. If no sign
	# is given, you should return a positive number.

	# You may assume the string will always contain a valid number.

	# You may not use any of the standard conversion methods available in Ruby, such as String#to_i,
	# Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

	# input: String of digits, representing an Integer
	# output: Integer, either positive or negative 

	# Rules:
		# Explicit requirements:
		# - may assume the input will always be valid
		# - String may have a leading '+', '-', or no sign
		# - if no leading sign, return a positive Integer
		# - if leading '+', return a positive Integer
		# - if leading '-', return a negative Integer
		# - may not use any standard conversion methods
		# - can use `string_to_integer` method from previous lesson

		# Implicit requirements:
		# - 

# Examples: 
  # - string_to_signed_integer('4321') == 4321
	# - string_to_signed_integer('-570') == -570
	# - string_to_signed_integer('+100') == 100

# Data Structure(s): 
  # - Array
	# - if/elsif/else

# Algorithm: 

	# `string_to_signed_integer` method
	# ==================================
		# - define a method called `string_to_signed_integer` that has one parameter called `string`
		# - check to see if first character of `string` is equal to '+'
		  # - if it is; delete '+' from `string`; then return value of invoking `string_to_integer` on `string`
		# - check to see if first character of `string` is equal to '-'
			# - if it is; delete '-' from `string`; then return value of invoking `string_to_integer` on `string` * -1
		# - if neither of those conditions were met; return value of invoking `string_to_integer` on `string`

# Code:

def string_to_integer(string)
  num_arr = string.chars.map { |num| num.ord - 48 }

  value = 0
  num_arr.each { |num| value = 10 * value + num }
  value
end

def string_to_signed_integer(string)
	leading_char = string.chars.first
	result = string_to_integer(string.delete('+-'))

	leading_char == '-' ? -result : result
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# Further Exploration
# In our solution, we call string[1..-1] twice, and call string_to_integer three times. This is somewhat repetitive.
# Refactor our solution so it only makes these two calls once each.

# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   when '+' then string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end