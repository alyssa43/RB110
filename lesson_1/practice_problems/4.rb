# What is the return value of each_with_object in the following code? Why?
val = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

p val 

=begin
The return value will be a new hash: `{"a"=>"ant", "b"=>"bear", "c"=>"cat"}`. This is
because `each_with_object` calls the block once for each element (which in this case 
was an array of three elements), as well as the given object (which in this case was
an empty hash). It will then return the return value within the block to the given 
object upon each iteration. So in this case we get a hash where upon each iteration 
we get a return value of assigning a hash key that is the 0 indexed character, with 
the value of the element that is being iterated. 
=end