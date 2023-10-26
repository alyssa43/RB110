# PROBLEM:

# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other
# number, and then computes the sum of those multiples. For instance, if the supplied number
# is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# input: Integer
# outputs: new Integer, that represents sum

# Rules:
		# Explicit requirements:
		# - input Integer will be greater than 1
		# - Find all multiples of 3 and 5 between 1 and the input Integer

		# Implicit requirements:
		# - if input Integer is not evenly divisible by 3 or 5, it will not be included in returned array

# Algorithm: 

	# multisum method
	# ===============
		# - define a method called `multisum` that has one parameter called `num`
		# - initialize an empty array called `num_arr`
			# - `num_arr` will be used to contain all numbers to be summed
		# - initialize a local variable called `threes` and assign it to the Integer `3`
		# - initialize a local variable called `fives` and assign it the the Integer `5`
		# - create a `loop` 
			# - `break` out of `loop` when `threes` is greater than `num`
			# - add value of `threes` to `num_arr`
			# - increment the value of `threes` by `3`
		# create another `loop`
			# - `break` out of `loop` when `fives` is greater than `num`
			# - add value of `fives` to `num_arr`
			# - increment the value of `fives` by `5`
		# on final line of `multisum`, invoke `union` to get rid of any duplicates; then invoke `sum`

# Test cases:

# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168 

# Second Try 

def multisum(num)
	num_arr = (1..num).to_a.select do |num|
		num % 3 == 0 || num % 5 == 0
	end
	num_arr.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
p multisum(1) == 0

=begin 
# First Try 

	def multisum(num)
	num_arr = []
	threes = 3
	fives = 5

	loop do			# loop to add multiples of 3
		break if threes > num
		num_arr << threes
		threes += 3
	end

	loop do			# loop to add multiples of 5
		break if fives > num
		num_arr << fives
		fives += 5
	end

	num_arr.union.sum
end
=end