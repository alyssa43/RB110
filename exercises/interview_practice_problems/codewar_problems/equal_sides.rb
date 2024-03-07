# You are going to be given an array of integers. Your job is to take that 
# array and find an index N where the sum of the integers to the left of N is 
# equal to the sum of the integers to the right of N. If there is no index that 
# would make this happen, return -1.

# For example:
# Let's say you are given the array {1,2,3,4,3,2,1}:
# Your function will return the index 3, because at the 3rd position of the 
# array, the sum of left side of the index ({1,2,3}) and the sum of the right 
# side of the index ({3,2,1}) both equal 6.

# Let's look at another one.
# You are given the array {1,100,50,-51,1,1}:
# Your function will return the index 1, because at the 1st position of the 
# array, the sum of left side of the index ({1}) and the sum of the right side 
# of the index ({50,-51,1,1}) both equal 1.

# Last one:
# You are given the array {20,10,-80,10,10,15,35}
# At index 0 the left side is {}
# The right side is {10,-80,10,10,15,35}
# They both are equal to 0 when added. (Empty arrays are equal to 0 in this 
# problem)
# Index 0 is the place where the left side and right side are equal.

# Note: Please remember that in most languages the index of an array starts at 
# 0.

# Input
# An integer array of length 0 < arr < 1000. The numbers in the array can be 
# any integer positive or negative.

# Output
# The lowest index N where the side to the left of N is equal to the side to 
# the right of N. If you do not find an index that fits these rules, then you 
#   will return -1.

# Note
# If you are given an array with multiple answers, return the lowest correct 
# index.

=begin
problem: given an array of integers, find and return the index where all
integers to the left and all integers to the right have an equal sum
  - input: array
  - output: integer
  - rules:
    - if one side of current element is empty, sum is 0
    - return -1 if there is no index where sums are equal
    - if multiple indexes have equal sides, return the first index to meet criteria

data structure:
  - starting: array of integers
  - intermediate: left side array and right side array
  - ending: integer

algorithm:
  - iterate through the input array passing in index
    - slice left side and right side
      - left side will start at `0` index and go to current index - 1
      - right side will start at current index + 1 and go to -1 index
    - find sums or both left side and right side
      - if sums are equal return current index
  - if we iterate through all integers without returning anything
    - return -1
=end

def find_even_index(arr)
  arr.each_index do |i|
    left_side = (i == 0) ? [] : arr[0..i - 1]
    right_side = (i == (arr.size - 1)) ? [] : arr[i + 1..-1]
    return i if left_side.sum == right_side.sum
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0 #Should pick the first index if more cases are valid
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1

# completed on 3/6/2024 in 15 minutes