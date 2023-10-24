# How does take work? Is it destructive? How can we find out?

p arr = [1, 2, 3, 4, 5]
p arr.take(2)
p arr
=begin
When we invoke the `Array#take` method we must pass it an argument that is a positive Integer. It
then takes that Integer and returns that number of elements from within the calling array, starting
at the 0 index. It is not a destructive call, so the calling array will not get mutated. We can find
this out by looking at the Ruby documentation.
=end
