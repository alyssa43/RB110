# Problem:
# ========
# Write a method that takes two strings as arguments, determines the longest of the two strings,
# and then returns the result of concatenating the shorter string, the longer string, and the
# shorter string once again. You may assume that the strings are of different lengths.

# input: two separate strings
# output: one new string

# Rules:
	# Explicit:
		# - strings will be different lengths
		# - return concatenated string containing shortest string, longest string, then shortest string
	
	# Implicit: 
		# - strings can be empty

# Examples:
# =========
# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"

# Data Structure:
# ===============
# strings

# Algorithm:
# ==========
	# short_long_short method
	# =======================
	# - define a method called `short_long_short` that has two parameters `str1` and `str2`
	# - check to see which string has the longest length
	# - return shortest string `+` longest string `+` shortest string

# Code

def short_long_short(str1, str2)
	if str1.length > str2.length
		str2 + str1 + str2
	elsif str1.length < str2.length
		str1 + str2 + str1
	end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"


