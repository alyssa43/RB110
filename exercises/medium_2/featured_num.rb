# A featured number (something unique to this exercise) is an odd number that is 
# a multiple of 7, and whose digits occur exactly once each. So, for example, 49 
# is a featured number, but 98 is not (it is not odd), 97 is not (it is not a 
# multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next 
# featured number that is greater than the argument. Return an error message if 
# there is no next featured number.

# Examples:
# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
def featured_num?(num)
  num.odd? && num % 7 == 0 && num.digits.uniq.size == num.digits.size
end

def featured(num)
  loop do
    num += 1
    return num if featured_num?(num)
    break if num > 9_876_543_210
  end
  'There is no possible number that fulfills those requirements'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)