selected_foods = [['apple', 'kiwi'], ['artichoke', 'broccoli']].select do |arr|
  arr.select do |food|
    puts food
  end
end

p selected_foods

=begin
the inner most `do..end` block 

The return value for this code will be:`[['apple', 'kiwi'], ['artichoke', 'broccoli']]`. One line 1
we are initializing a local variable called `selected_foods` and assigning it to reference the return 
value of invoking the `select` method on a nested array with two elements, and within those two elements
is an array with two elements. We then have a `do..end` block as the argument that has one parameter called
`arr`, `arr` will reference each array as it enters it's iteration. Then within that block we then invoke 
the `select` method on `arr`, which also has a block as an argument that has one parameter called `food`.
Each element within the `arr` array will be referenced by the `food` 
=end