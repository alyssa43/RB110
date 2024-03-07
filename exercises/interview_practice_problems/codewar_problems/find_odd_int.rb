# Given an array of integers, find the one that appears an odd number of times.

# There will always be only one integer that appears an odd number of times.

# Examples
# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which 
# is odd).

=begin
problem: given an array of integers, find and return the only integer that occurs
an odd number of times
  - input: array
  - output: integer

  - rules:
    - if input array only contains one integer, that integer will be returned
    - only one integer will occur an odd number of times

example:
  - if input is [1] we will return 1
  - if input is [1, 2, 1] we will return 2

data structure:
  - starting: array of integers
  - intermediate: filter input array to contain only integers that occur an odd
    number of times
  - ending: integer

algorithm:
  - filter array by elements that occur an odd amount using #select
    - return the first element
=end

def find_it(arr)
  arr.select { |number| arr.count(number).odd? }.first
end

p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
p find_it([10]) == 10
p find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10

# completed on 3/6/2024 in 7 minutes