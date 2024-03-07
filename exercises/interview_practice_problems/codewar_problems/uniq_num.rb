# There is an array with some numbers. All numbers are equal except for one. Try to find it!

# find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
# find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
# It’s guaranteed that array contains at least 3 numbers.

# The tests contain some very huge arrays, so think about performance.

=begin
problem: given an array of numbers, find and return the number that only occurs 1 time
  - input: array
  - output: number

  - rules:
    - input array will always contain at least 3 numbers

example:
  - if input is [1, 1, 1, 0] we will return 0
  - if input is [1, 2, 3, 1, 3] we will return 2

data structures:
  - starting: array of numbers
  - intermediate: 
      - filter down input array to contain only uniq numbers
      - filter down input array to contain only number that occurs once
  - ending: number

algorithm:
  - create a variable that contains only unique numbers
    * used to iterate through to compare against input array
  - iterate through the unique array
    - count the amount of times current number appears in input array
      - if current number appears once
        - return number
=end

def find_uniq(arr)
  arr.uniq.each { |num| return num if arr.count(num) == 1 }
end

p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

# Completed on 3/6/2024 in 7 minutes