def star(n)
  lines = Array.new(n) { ' ' * n }

  lines.each_with_index do |line, line_index|
    line[line_index] = '*'          # left
    line[n / 2] = '*'               # middle 
    line[n - line_index - 1] = '*'  # right
    line[0..-1] = '*' * n if line_index == n / 2 # middle line
  end

  lines.each { |line| puts line }
end

star(7)
# output:
# *  *  * -> line 1 -> *, two spaces, *, two spaces, *
#  * * *  -> line 2 -> one space, *, one space, *, one space, * one space
#   ***   -> line 3 -> two spaces, ***, two spaces
# ******* -> line 4 -> 7 * -> *******
#   ***   -> line 5 -> same as line 3
#  * * *  -> line 6 -> same as line 2
# *  *  * -> line 7 -> same as line 1

# [ ['*' '_' '_' '*' '_' '_' '*']
#   ['_' '*' '_' '*' '_' '*' '_']
#   ['_' '_' '*' '*' '*' '_' '_']
#   ['*' '*' '*' '*' '*' '*' '*']
#   ['_' '_' '*' '*' '*' '_' '_']
#   ['_' '*' '_' '*' '_' '*' '_']
#   ['*' '_' '_' '*' '_' '_' '*']
# ]
puts

star(9)
# output:
# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *
