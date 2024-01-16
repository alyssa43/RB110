# Write a method that displays a 4-pointed diamond in an n x n grid, where n is 
# an odd integer that is supplied as an argument to the method. You may assume 
# that the argument will always be an odd integer.

# Examples

# diamond(1)

# *

# diamond(3)

#  *
# ***
#  *

# diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

def display_rows(numbers, max_num)
  numbers.each do |num|
    spaces = ' ' * ((max_num - num) / 2)
    stars = '*' * num
    puts spaces + stars
  end
end

def diamond(size)
  numbers = (1..size).to_a
  size.downto(1) { |n| numbers << n unless n == size }
  numbers.select! { |n| n.odd? }
  display_rows(num_arr, size)
end

diamond(1)
diamond(3)
diamond(9)