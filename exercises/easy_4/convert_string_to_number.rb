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


DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

HEX_DIGITS = {
	'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
	'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 
	'E' => 14, 'F' => 15
}

def string_to_integer(string)
  num_arr = string.chars.map { |num| num.ord - 48 }

  value = 0
  num_arr.each { |num| value = 10 * value + num }
  value
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

def hexadecimal_to_integer(str_hex)
  hex_digits = str_hex.upcase.chars.map {|char| HEX_DIGITS[char]}
	
	power = hex_digits.length - 1
	value = 0

	hex_digits.each do |digit|
		value += digit * 16 ** power
		power -= 1
	end
	value
end


p hexadecimal_to_integer('4D9f') == 19871
