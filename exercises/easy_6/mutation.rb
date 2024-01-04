# What will the following code print, and why? Don't run the code until you have
# tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin
Line 8 will output `Moe Larry CURLY SHEMP Harpo CHICO Grouch Zeppo`. This is
because on line 6 when we invoke the `Array#each` method and iterate through
`array1` each element gets passed into the block and the assigned to reference
`value` as it iterates through. We then invoke the `<<` method on each `value`
which is a mutating method call. Meaning that each object that `value` references
will now be appended to `array2`. So `array1` and `array2` are both identical and
both referencing the same objects within their Arrays. So then when we iterate
through `array1` again on line 7 and invoke the mutating method call `upcase!` on
any value that starts with `C` or `S`, both arrays will be mutated and see those 
changes as well.
=end
