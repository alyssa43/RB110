# What is the return value of the select method below? Why?
[1, 2, 3].select do |num|
  num > 5
  'hi'
end

=begin
The return value will be a new array: `[1, 2, 3]`. This is because the `select` method
will select and return the element that is being iterated, only if the 
return value within the block is evaluated as truthy. And beacuse the final line
within the block is simply the string `'hi'`, and because a string will evaulate
as a truthy value, all elements being iterated over will be returned. 
=end
