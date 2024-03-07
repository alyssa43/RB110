# If we list all the natural numbers below 10 that are multiples of 3 or 5, we 
# get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples of 3 or 5
# below the number passed in.

# Additionally, if the number is negative, return 0.

# Note: If the number is a multiple of both 3 and 5, only count it once.

=begin
problem: given an integer, find all the integers below the input integer that
  are multiples of 3 or 5. return the sum of all these integers that are
  multiples
  - input: integer
  - output: integer

  - rules:
    - if a number is negative, return 0
    - if a number is both a multiple of 3 and 5, only count it once

example:
  - if input is 10 the integers that are less than 10 and multiples of 3 and 5
  would be 3, 5, 6, and 9. if we add these up we get a sum of 23

data strucutre:
  - starting: integer
  - intermediate: array of integers that are less than the input number AND are
    multiples of 3 or 5
  -ending: integer

algorithm:
  - if input number is negative, return 0
  - create an array of integers 1 through one less than the input number
  - filter array to only keep integers that are multiples of 3 or 5
  - add up all remaining integers
=end

def solution(number)
 # return 0 if number.negative?
  (1..number - 1).to_a.select { |num| num % 3 == 0 || num % 5 == 0}.sum
end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168
p solution(-5)