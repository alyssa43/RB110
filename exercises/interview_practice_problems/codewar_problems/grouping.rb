# Your goal is to write the group_and_count method, which should receive and 
# array as unique parameter and return a hash. Empty or nil input must return 
# nil instead of a hash. This hash returned must contain as keys the unique 
# values of the array, and as values the counting of each value.

# Example usage:

# input = [1,1,2,2,2,3]

# group_and_count(input)# == {1=>2, 2=>3, 3=>1}
# The following methods were disabled:

# Array#count
# Array#length

=begin
problem: given an array, return a hash whose keys are the elements within the
input array and whose values are the number of occurrences each key is present
within the input array
  - input: array
  - output: hash

  - rules:
    - cannot use the #count method
    - cannot use the #length method
    - if input array is empty or nil, return nil

example:
  - if input is [0, 1, 1, 0] we will count each occurrance of each elements so
  first we have a `0` which occurs once so far, then we have a `1` which occurs
  once so far, then we have another `1` which gives us 2 `1`'s. Then finally we
  have another `0`, which gives us 2 `0`'s. If we put the elements as keys within
  a hash and the values the number of occurrences for each element; we have 
  { 0 => 2, 1 => 2}

data structures:
  - starting: array
    - intermediate: iterate through input array with a new Hash object 
  - ending: hash

algorithm:
  - iterate through input array and pass in each number anda Hash object that will 
  be returned
    - initialize all values to `0` to start
    - assign each number that is iterated over, to the key of the hash
      - increment it's value by 1
  - return hash
=end

def group_and_count(arr)
  return nil if arr.nil? || arr.empty?
  arr.each_with_object(Hash.new(0)) do |num, hsh|
    hsh[num] += 1
  end
end

p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([0,1,1,0]) == {0=>2, 1=>2}
p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}

# completed on 3/7/2024 in 10 minutes