# What is the return value of the following code? Why?

val = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

=begin
The return value of this code will be: `[1, nil, nil]`. This is because the `map` method will
always return a new array containing the same amount of elements, of the collection that called it,
which in this case is the array `[1, 2, 3]`. We have passed a `do..end` block as the argument that
has a parameter called `num`, which means `num` will reference each element within the calling 
array as it enters it's iteration. Within the block we have an `if..else` statement where the `if`
condition will get executed if the `num` variable is greater than `1`. Because the first number to
get passed in and be referenced by the `num` variable is `1`, the if condition does not get
executed, it then executes the code following `else`, which is returning `num` which in this case
is the Integer `1`. Which is where we get the first element within our new returned array. On the
second and third iterations the `if` condition does get executed because the expression `num > 1`
will evaluate as true for the Integers `2` and `3`, which means the `puts` method invocation with
`num` as the argument gets executed resulting in the output of `2` and `3` on separate lines. And
because the `puts` method invocation will always return `nil`, that is the return value for the 
next two elements in our new returned array.
=end