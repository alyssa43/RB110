=begin
problem: given an array of integers, return an Integer that represents the quantity
of integer pairs in input array
  - input: array
  - output: integer
  - rules:
    - input array may be empty or only contain one integer
      * if so return `0` 
    - if one integer occurs in multiple pairs, count all pairs ex. [2, 2, 2, 2] will
    return `2`
data structure:
  - starting: array
  -intermediate: - an array of only unique integers
  - ending: integer
algorithm:
  - create a new array variable that contains only unique integers
  - create a variable that will be used to count pairs 
    - assign the value of variable to `0`
  - iterate through uniq integers
    - count the number of times current integer occurs in input array
      - divide that number by 2
        - add that value to the count pairs variable and reassign as new value
  - return count pairs variable
=end

def pairs(arr)
  pair_count = 0
  arr.uniq.each do |num|
    pair_count += arr.count(num) / 2
  end
  pair_count
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

# completed on 3/6/24 in < 20 mins (didn't time)