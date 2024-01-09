# Write a method that returns a list of all substrings of a string that start at 
# the beginning of the original string. The return value should be arranged in 
# order from shortest to longest substring.

# Examples:
# leading_substrings('abc') == ['a', 'ab', 'abc']
# leading_substrings('a') == ['a']
# leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

def leading_substrings(str)
  str.chars.map.with_index { |_, i| (str.chars[0..i]).join }
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']