# What does shift do in the following code? How can we find out?
hash = { a: 'ant', b: 'bear' }
hash.shift 

=begin
On line 2, when we invoke the `shift` method on our local variable `hash`, we get a return value of a new
array object with two elements: `[:a, "ant"]`. This is because the `shift` method will remove the first 
hash entry, and return it to an array with 2 elements, one being the removed key and other other the 
removed value. Also, because it is a mutating method call, the `hash` variable now has the value of:
`{:b=>"bear"}`. We can find this information by looking at the Ruby documentation.
=end