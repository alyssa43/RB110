# PROBLEM:

# Write a method that takes an Array of numbers, and returns an Array with the same number of
# elements, and each element has the running total from the original Array.
# A running total is the sum of all values in a list up to and including the current element. 
# Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is
# 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).


# input: array of number
# outputs: a new array, with same number of elements

# Rules:
		# Explicit requirements:
		# - return a new Array, with same number of elements as input array

		# Implicit requirements:
		# - each element in returned Array should be equal to the sum of all elements indexed prior..
		# - ..to current element AND current element in input Array


# Algorithm: 

	# running_total method
	# =============================
		# - define a method called `running_total` that has one parameter called `input_arr`
		# - initialize a local variable called `running_total_arr` and assign it to reference
			# - the return value of invoking the `map` method on `input_arr`
			# - inside the `map` method block, assign a parameter called |num|
			# - inside the block, access the elements at the 0 index through the current element
        # - being iterated over, then calculate the sum of those numbers.
      # - return that value 
		

# Test cases:

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

# Code:

def running_total(input_arr)
  input_arr.map do |num|
    input_arr[0..input_arr.index(num)].sum
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []


#Further Exploration
#Try solving this problem using Enumerable#each_with_object or Enumerable#reduce (note that Enumerable methods can be applied to Arrays).

def running_total(input_arr)
  input_arr.each_with_object([]) do |num, running_total_arr|
    running_total_arr << input_arr[0..input_arr.index(num)].inject(:+)
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []