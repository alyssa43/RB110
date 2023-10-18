# Problem:
# ========
# Write a method that takes a year as input and returns the century. The return value should be a
# string that begins with the century number, and ends with st, nd, rd, or th as appropriate for
# that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# input: integer, that represents a year
# output: string, that represents the century, with appropriate suffix

# Rules:
	# Explicit:
		# - new centuries begin in years that end with '01'. (1901-2000 is the 20th century).
		# - add appropriate suffix to the century
	
	# Implicit: 
		# - years: 1-100 are '1st'; 101-200 are '2nd'; 201-300 are '3rd'; ...


# Examples:
# =========
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

# Data Structure:
# ===============
# numbers
# string
# case statement

# Algorithm:
# ==========
	# century method
	# ==============
	# - define a method called `century` that has one parameter called `year`
	# - calulate the century the year is in:
		# - divide year by '100', then add '1'
		# - if year end in '0', subtract '1'
	# - return century

	# add_suffix method
	# =================
	# - define a method called `add_suffix` that has one parameter called `century`
	# - identify the last digit in century
	# - create case statement that is checking the last digit
	 # - case statement will return appropraite suffix


# Code

def century(year)
	century = year / 100 + 1
	if year % 100 == 0 
		century -= 1
	end
	century.to_s + add_suffix(century)
end 

def add_suffix(century)
	last_digit = century % 10
	if century.to_s.end_with?('11') || century.to_s.end_with?('12') || century.to_s.end_with?('13')
		return 'th'
	end
	
	case last_digit
	when 1 then 'st'
  when 2 then 'nd'
	when 3 then 'rd'
	else 'th'
	end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'