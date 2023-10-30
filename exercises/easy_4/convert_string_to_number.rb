# PROBLEM:

# The String#to_i method converts a string of numeric characters (including an optional plus or
# minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly.
# In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer.
# You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters;
# assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby to convert a string to
# a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way
# and calculate the result by analyzing the characters in the string.


# input: String of digits
# outputs: Integer representing input string converted to integers

# Rules:
		# Explicit requirements:
		# - can assume all characters are a valid input
    # - do not worry about + or - signs
    # - can not use any standard conversion methods (ex: `to_i`)


		# Implicit requirements:
		# - 

# Algorithm: 

	# `string_to_integer` method
	# =============================
		# - define a method called `string_to_integer` that has one parameter called `str_num`
    # - 
		

# Test cases:
 # - string_to_integer('4321') == 4321
 # - string_to_integer('570') == 570

# Code: