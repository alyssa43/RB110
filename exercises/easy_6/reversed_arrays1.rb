# Write a method that takes an Array as an argument, and reverses its elements in place; that is,
# mutate the Array passed into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

# Examples:
# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true

# list = []
# reverse!(list) == [] # true
# list == [] # true

# Note: for the test case list = ['abc'], we want to reverse the elements in the array. The 
# array only has one element, a String, but we're not reversing the String itself, so the 
# reverse! method call should return ['abc'].

def reverse!(arr)
  arr.sort! { |a, b| arr.index(b) <=> arr.index(a) }
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true
puts ''
p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true
puts ''
p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true
puts ''
p list = []
p reverse!(list) == [] # true
p list == [] # true
