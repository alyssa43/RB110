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
			# - inside the `map` method block assign a parameter called |num|
			# - inside the block, using bracket notation
		

# Test cases:

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []





running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

# A running total is the sum of all values in a list up to and including the current element. 
# Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is
# 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).