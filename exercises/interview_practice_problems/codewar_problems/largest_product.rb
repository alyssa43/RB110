# Complete the greatestProduct method so that it'll find the greatest product of 
# five consecutive digits in the given string of digits.

# For example:

# greatestProduct("123834539327238239583") // should return 3240
# The input string always has more than five digits.

=begin
problem: given a string of number characters, find all the substrings that are
  5 consecutive characters. Then find the product of all these substrings if
  substring is broken down by individual character and transformed into a number
  then return the highest product of substrings
   - input: string
   - output: integer
example:
  - if input is "123834539327238239583" and we break it down into substrings of
  five consecutive number characters we would ge substrings "12383", "23834", "38345",
  "83453", "34539", "45393", "53932", "39327", "93272", "32723", "27238", "72382",
  "23823", "38239", "82395", "23958", "39583" so the last substring's product is 
  3240, which will be the largest substring product which is why we return 3240
data structure:
  - starting: string
  - intermediate: array whose elements are the sliced substrings
  - ending: integer

algorithm:
  - part one: find all substrings that are 5 consecutive characters
    - starting at first character of input string
      - slice 5 characters
    - increment character until at the -5 indexed character
  - part two: transform each substring into it's product
    - using #map, iterate through each substring
      - break down substring into an array of characters
        - transform those characters into integers
      - find product of transformed integers array by using #inject(&:*)
  - part three: finding the largest product
    - sort array of products from smallest to largest
      - return the last value in sorted array
=end

def greatest_product(str_num)
  substrings = []
  0.upto(str_num.size - 5) { |index| substrings << str_num[index, 5] }
  products = substrings.map do |substring|
    substring.chars.map { |char| char.to_i }.inject(&:*) 
  end
  products.sort.last
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

# Completed on 3/6/2024 in 22 minutes