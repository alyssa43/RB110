# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

=begin
The return value of this code will be the array: `[nil, "bear"]`. This is because the `map` method
is used to transform the elements within the collection that are calling it; and because the hash
that called the `map` method has two elements, we will get a new array with two elements.Inside the
block we have two parameters called `key` which is referencing the calling hashes keys, and `value`
which is referencing the calling hashes values. Within the block we have an `if` statement that is
evaluating the expression `value.size > 3`. If this expression evaluates as true then we are 
implicitly returning `value`. Upon the first iteration of the `map` method, `key` is referencing
the symbol `:a` and value is referencing the string `'ant'`. And because because the expression
`value.size > 3` breaks down like so: `'ant'.size > 3` -> `3 > 3` which has the return value of
`false`, the `if` condition never gets evaluated and in turn defaults to returning the value `nil`
as the first element within the new array. On the second iteration the String object `'bear'` gets
returned as the second element. 
 =end
