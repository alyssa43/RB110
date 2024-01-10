# Write a method which takes a grocery list (array) of fruits with quantities 
# and converts it into an array of the correct number of each fruit.

# Example:
# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]

def buy_fruit(grocery_list)
  result = []
  grocery_list.each do |item|
    item[1].times do 
      result << item[0]
    end
  end
  result
end

def buy_fruit(grocery_list)
  grocery_list.map { |item, quantity| [item] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]