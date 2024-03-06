# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

=begin
problem: given an array of integers, return `nil` if array contains less than
  5 elements. Otherwise return an Integer that represents the minimum sum, or
  5 consecutive numbers from input array.
  - input: array (of integers)
  - output: either `nil` or an Integer

  rules:
    - if array contains less than 5 elements, return `nil`
    - must return the minimum sum of 5 consecutive numbers
      - consecutive meaning 5 one right after the other

examples:
  - if input is [1, 2, 3, 4, 5, 6] we will have 2 sums. so sum of [1, 2, 3, 4, 5]
    which is 15 and the sum of [2, 3, 4, 5, 6] which is 20. We return `15` because
    that is the smallest of the two sums

data structure:
  - starting: array of integers
  - intermediate: slice of input array that contains the 5 consecutive elements
  - ending: with an Integer or `nil`

algorithm:
  - return `nil` if input array size is less than 5
  - create a new array variable that will be initialized to an empty array
    * will be used to hold the sums of 5 consecutive elements
  - iterate through input array using elements index
    - until index > input arrays size - 5, then break
      - slice 5 consecutive elements starting at current index
        - sum the return value of the sliced portion of the array
          - append that value to the `sums` variable
  - sort the `sums` array
    - return the first element within that sorted array
=end

def minimum_sum(array)
  sums = []
  array.each_index do |i|
    break if i > (array.size - 5)
    slice = array[i, 5]
    sums << slice.sum
  end
  sums.sort.first
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".

# Completed on 3/5/24 in 19 minutes