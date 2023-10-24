# What is the return value of the following statement? Why?
['ant', 'bear', 'caterpillar'].pop.size

=begin
This code will return the integer `11`. This is because we are invoking the
`String#size` method on the return value of invoking the `Array#pop` method
on the above array. And because the `Array#pop` method removes *and* returns
the last element within the calling array, that means we are invoking the
`String#size` method on the String object `'caterpillar'`. Then the `size`
method returns `11` because it returns the numbers of characters within the
String. Also, because the `Array#pop` method is destructive, that means the
calling array will be mutated as well.
=end
