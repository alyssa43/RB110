# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

=begin
problem: given an array of an unknown amount of integers, find and return
  the two integers that are closest in value. return these integers inside
  an array
  - input: array (of integers)
  - output: array (of 2 integers)

  - rules:
    - ORDER matters
      - must return the selected integers in the same order as input array
    - may assume that input array will always contain more than 2 integers
    
example:
  - if input is [5, 25, 15, 11, 20], and we sorted that to make it easier
    to read we would have [5, 11, 15, 20, 25]. Now that we know we only 
    need to check the difference between adjacent numbers, we can find the
    difference between adjacent elements, which means that 5&11 = 6, 11&15 = 4,
    15&20 = 5, and 20&25 = 5. The two numbers with the smallest difference
    (or closest in value) are 11 and 15. However we need to maintain order
    from input array so we will return [15, 11]

data structure:
  - starting: array (of unknown amount of integers)
  - intermediate: 
    - array that has all of input integers sorted from smallest to largest
  - ending: array (of 2 integers)

algorithm:
  - create a variable that will reference the input array that has been sorted
    smallest to largest (`sorted_arr`)
  - create a variable and assign it to the sum of the input array (`smallest_difference`)
    * this variable will be used to check for the smallest difference between
      adjacted sorted integers (assigning it to the sum of the input array is
      just to make sure its value is always higher than the first two numbers
      difference to be compared)
  - create a variable that will reference an empty array (`result`)
    * this variable will be used to hold the two numbers that are closest in
      value
  - iterate over the `sorted_arr` array passing in both number and index
    - find the difference between current number and next number
      - if the difference is less than the value of `smallest_difference`
        - assign `result` to equal current number and the next number
        - assign `smallest_difference` to now reference the next smallest difference
      - break from iteration if index is equal to array size - 1
  - select integers from input array that are also within `result`
=end

def closest_numbers(arr)
  sorted_arr = arr.sort
  smallest_difference = arr.sum
  result = []
  sorted_arr.each_with_index do |num, i|
    break if i == arr.size - 1
    current_difference = sorted_arr[i + 1] - num
    if current_difference < smallest_difference
      result = [num, sorted_arr[i + 1]]
      smallest_difference = current_difference
    end
  end
  arr.select { |num| result.include?(num) }
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 18]) == [12, 7]

# The tests above should print "true".

# Completed 3/5/24
  # first attempt quit at 40 mins
  # second attempt completed at 22 mins