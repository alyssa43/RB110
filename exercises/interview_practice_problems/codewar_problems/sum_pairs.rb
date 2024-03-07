# Given a list of integers and a single sum value, return the first two values 
# (parse from the left please) in order of appearance that add up to form the sum.

# If there are two or more pairs with the required sum, the pair whose second 
# element has the smallest index is the solution.

# sum_pairs([11, 3, 7, 5],         10)
# #              ^--^      3 + 7 = 10
# == [3, 7]

# sum_pairs([4, 3, 2, 3, 4],         6)
# #          ^-----^         4 + 2 = 6, indices: 0, 2 *
# #             ^-----^      3 + 3 = 6, indices: 1, 3
# #                ^-----^   2 + 4 = 6, indices: 2, 4
# #  * the correct answer is the pair whose second value has the smallest index
# == [4, 2]

# sum_pairs([0, 0, -2, 3], 2)
# #  there are no pairs of values that can be added to produce 2.
# == None/nil/undefined (Based on the language)

# sum_pairs([10, 5, 2, 3, 7, 5],         10)
# #              ^-----------^   5 + 5 = 10, indices: 1, 5
# #                    ^--^      3 + 7 = 10, indices: 3, 4 *
# #  * the correct answer is the pair whose second value has the smallest index
# == [3, 7]
# Negative numbers and duplicate numbers can and will appear.

# NOTE: There will also be lists tested of lengths upwards of 10,000,000 elements. 
# Be sure your code doesn't time out.

=begin
problem:  given an array of integers and an integer `target`, return an array with 
two integer elements. The output array's elements should be the first two numbers 
to appear that add up to equal the target.
  - input: 
    - array
    - integers
  - output: array

  -rules:
    - there may be multiple answers
      - the correct answer will be the smallest second index
    - input array may contain duplicate numbers
    - input array may contain negative numbers
    - target number may be negative
    - if there are no pairs that add up to the target, return nil

examples:
  - if input array is [1, 4, 8, 7, 3, 15] and target is 8; we will return [1, 7]
    we will check if these pairs are equal to the target:
    1+4, 1+8, 4+8, 1+7 - we stop here because that reaches our target sum so we
    return [1, 7]
  - if input array is [10, 5, 2, 3, 7, 5] and target is 10; we will return [3, 7]
    we will check if these pairs are equal to the target:
    10+5, 10+2, 5+2, 10+3, 5+3, 2+3, 10+7, 5+7, 2+7, 3+7 - we stop here because that
    reaches our target sum so we will return [3, 7]

data structure:
  - starting: array and integer
    - intermediate: array of pairs possibly?
  - ending: array

algorithm:
  - iterate through input array
    * we will need to access two numbers to add together and check their sum
    - the first number will start at the `0` index
    - the second number will start at the `1` index
      - check to see if these two numbers added together are equal to the sum
* AT EVERY CHECK * explicitly return numbers in an array if numbers sum is equal to target
    - increment the second numbers index by 1
      - check numbers again
      - increment the first numbers index by 1
        - check numbers again
        - continue doing until both first numbers index and second numbers index are the same
    - reset first numbers index to 0
    - REPEAT LINES 71 - 76 until all iterations have been iterated through
  - if nothing has been explicitly returned; return nil
=end

def sum_pairs(arr, target)
  1.upto(arr.size - 1) do |num2_index|
    num1_index = 0
    until num1_index == num2_index
      nums = [arr[num1_index], arr[num2_index]]
      return nums if nums.sum == target
      num1_index += 1
    end
  end
  nil
end

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]


p (sum_pairs(l1, 8)) #== [1, 7]
p (sum_pairs(l2, -6)) #== [0, -6]
p (sum_pairs(l3, -7)) #== nil
p (sum_pairs(l4, 2)) #== [1, 1]
p (sum_pairs(l5, 10)) #== [3, 7]
p (sum_pairs(l6, 8)) #== [4, 4]
p (sum_pairs(l7, 0)) #== [0, 0]
p (sum_pairs(l8, 10)) #== [13, -3]
