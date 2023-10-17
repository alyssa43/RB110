=begin
# Sum Even Number Rows
=======================
Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows,
with the first row containing one integer, the second row two integers, the third row three
integers, and so on. Given an integer representing the number of a particular row, return an
integer representing the sum of all the integers in that row.

EX:
row 1: 2
row 2: 4, 6
row 3: 8, 10, 12
row 4: 14, 16, 18, 20
row 5: 22, 24, 26, 28, 30
=end

# Rules / Requirements
  # sequence of even integers
  # sequence begins with two
  # integers are consecutive
  # integers are even
  # sequence is grouped into rows
  # each row incrementally larger: 1, 2, 3...
  # row `number` equals the number of elements in the row
    # row 1 has 1 element, row 2 has 2 elements, ...


def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  rows.last.sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length 
  end
  row 
end

p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(3) == 30
p sum_even_number_row(4) == 68

# p create_row(2, 1) == [2]
# p create_row(4, 2) == [4, 6]
# p create_row(8, 3) == [8, 10, 12]

