require 'pry'

# If you take a number like 735291, and rotate it to the left, you get 352917. If 
# you now keep the first digit fixed in place, and rotate the remaining digits, 
# you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. 
# Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, 
# keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. 
# The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation 
# of that argument. You can (and probably should) use the rotate_rightmost_digits method 
# from the previous exercise.

# Note that you do not have to handle multiple 0s.

# Example:
# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845

def rotate_array(arr)
  result = arr[1..-1]
  result.push(arr[0])
end

def rotate_rightmost_digits(num, digit)
  num_arr = num.digits.reverse
  starting_index = num_arr.count - digit
  num_arr[starting_index..-1] = rotate_array(num_arr[starting_index..-1])
  num_arr.join.to_i
end

# First Solution - using `rotate_array`
def max_rotation(num)
  num_arr = num.digits.reverse
  result = []
  new_num_arr = num_arr
  num_arr.count.times do
    new_num_arr = rotate_array(new_num_arr)
    result << new_num_arr.shift
  end
  result.join.to_i
end

# Second Solution - using `rotate_rightmost_digits`
def max_rotation(num)
  count = num.digits.count
  until count == 0
    num = rotate_rightmost_digits(num, count)
    count -= 1
  end
  num
end

# Further Exploration
def max_rotation(num)
  num_arr = num.digits.reverse
  new_num_arr = num_arr[1..-1] + [num_arr[0]]
  result = []

  new_num_arr.count.times do 
    result << new_num_arr.shift
    leading_num = new_num_arr[0]
    new_num_arr = new_num_arr[1..-1] + [leading_num] rescue nil
  end
  result.join.to_i
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(1_005_000_345) #== 503_500_140