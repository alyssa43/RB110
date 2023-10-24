# What is the block's return value in the following code? How is it
# determined? Also, what is the return value of any? in this code and
# what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

=begin
* The block's return value will either be `true` if the `num` variable
is an odd number, or `false` if it is an even number. When we invoke the
`any?` method on an array, each element within the calling array will be
iterated over and passed into the block upon it's iteration. When it gets
passed into the block, it will be referenced by the parameter defined in
the block, which in this case is `num`. Once within the block, the return
value of the block will be whatever the final line of the block evaluates
to since there is no explicit return elsewhere within the block. On the
final line we invoke the `odd?` method on `num`, which will either return
`true` or `false`.

*The return value of `any?` will be `true`. This is because `any?` will
return `true` if at least one element returns a truthy value when passed
into the block. And in this case, `true` is returned upon the first
iteration. Because `any?` will stop iterating after getting the first
truthy return value, the numbers `2` and `3` do not get iterated over,
which is why we get the output: `1`.
=end
