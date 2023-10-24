# What is the return value of reject in the following code? Why?
[1, 2, 3].reject do |num|
  puts num
end

=begin
The return value will be a new array: `[1, 2, 3]`. This is because `reject` works similarly
to `select`, basically just opposite. It will return the elements that return a falsy value
to a new array. And because the final (and only) line within the block is a `puts` method
invocation, and since that will always return `nil`, any element being iterated over will
return a falsy value, then being returned to the new array.
=end