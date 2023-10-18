# Problem:
# ========
# In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly
# divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by
# 100, then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that takes any year
# greater than 0 as input, and returns true if the year is a leap year, or false if it is not
# a leap year.


# input: integer, that represents a year
# output: boolean, representing if the input year is a leap year

# Rules:
	# Explicit:
		# - input year will be greater than '0'
		# - if year % 4 == 0 AND year % 100 != 0; then it is a leap year
		# - if year % 100 == 0 AND year % 400 == 0 ; then it is a leap year
		# - return `true` if it is a leap year; `false` if it is not a leap year
	
	# Implicit: 
		# - 


# Examples:
# =========
# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true

# Data Structure:
# ===============
# condition checks

# Algorithm:
# ==========
	# leap_year? method
	# =================
	# - define a method called `leap_year?` that has one parameter called `year`
	# - check conditions
	# - return a boolean

# Code

def leap_year?(year)
  (year % 4 == 0 && year % 100 != 0) || (year % 100 == 0 && year % 400 == 0)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true