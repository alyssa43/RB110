# Task :
# Given a List [] of n integers , find minimum number to be inserted in a list, 
# so that sum of all elements of list should equal the closest prime number .

# Notes
# List size is at least 2 .

# List's numbers will only positives (n > 0) .

# Repetition of numbers in the list could occur .

# The newer list's sum should equal the closest prime number .

# Input >> Output Examples
# 1- minimumNumber ({3,1,2}) ==> return (1)
# Explanation:
# Since , the sum of the list's elements equal to (6) , the minimum number to 
# be inserted to transform the sum to prime number is (1) , which will make the 
# sum of the List equal the closest prime number (7) .

# 2-  minimumNumber ({2,12,8,4,6}) ==> return (5)
# Explanation:
# Since , the sum of the list's elements equal to (32) , the minimum number to 
# be inserted to transform the sum to prime number is (5) , which will make the 
# sum of the List equal the closest prime number (37) .

# 3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
# Explanation:
# Since , the sum of the list's elements equal to (189) , the minimum number to 
# be inserted to transform the sum to prime number is (2) , which will make the 
# sum of the List equal the closest prime number (191) .

def prime?(num)
  num <= 1 ? false : (2..Math.sqrt(num)).none? { |i| num % i == 0 }
end

# def minimum_number(numbers) # first solution
#   increment = 0
#   until prime?(numbers.sum)
#     increment += 1
#     numbers << 1
#   end
#   increment
# end

def minimum_number(numbers) # second solution that doesn't mutate input array
  prime_sum_nums = numbers.dup
  prime_sum_nums << 1 until prime?(prime_sum_nums.sum)
  prime_sum_nums.sum - numbers.sum
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2

# Completed on 3/6/2024 didn't time
