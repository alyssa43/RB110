# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

=begin
problem: given an array of integers, return an array with the same
number of elements where each integer represents how many numbers
in the input array the number is greater than 
  - input: array
  - output: array

  - rules:
    - the output array will have the same number of elements as the
      input array
    - if a number occurs multiple times, it should only be counted
      once
    - if an input array only contains one element, an array containing
      `0` should be returned
    - if an input array only contains elements of one number, all
      elements within returned array should be `0`

- examples:
  - if input is [1, 2, 2, 3, 4] the output should be an array with 5
    elements. The first element `1` is not greater than any of the
    other elements, so it should become a `0`. `2` is greater than `1`
    so both `2`'s should be `1`. `3` is greater than `2` and `1` so it
    become a `2`. and `4` is greater than `1`, `2`, and `3` so it becomes
    a `3` leaving us with an array of [0, 1, 1, 2, 3]

- data structure:
  - starting: array
  - intermediate: array where input elements are sorted and unique elements
    are removed
  - ending: array

- algorithm:
  - create a variable that will hold an array of the sorted and unique numbers
    from the input array
  - transform the input array so each element references the index of the current
    number within the sorted and unique array
  - return that transformed array
=end

def smaller_numbers_than_current(array)
  sorted_arr = array.sort.uniq
  array.map do |number|
    sorted_arr.index(number)
  end
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".

# Completed on 3/5/24 in 15 minutes