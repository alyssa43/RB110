# Write a method that combines two Arrays passed in as arguments, and returns a
# new Array that contains all elements from both Array arguments, with the 
# elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the 
# same number of elements.

# Example:
# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

def interleave(arr1, arr2)
  combined_arrs = []
  count = 0
  until count == arr1.length
    combined_arrs.concat([arr1[count]], [arr2[count]])
    count += 1
  end
  combined_arrs
end

# FURTHER EXPLORATION:

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']