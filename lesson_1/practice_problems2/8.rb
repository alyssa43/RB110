# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

=begin
This code will output: `1` `3` ; on separate lines.
On the first iteration `number` will reference the `0` indexed element; which is the Integer `1`. Which is
why `1` gets output when we invoke the `p` method on `number` on line 5. Then on line 6 when we invoke
the `shift` method on `numbers` it will mutate our original array by removing the first element.
`numbers` now references the array: `[2, 3, 4]`. So then on the second iteration `number` will reference
the `1` indexed element; which is the Integer `3`. Which is why when we invoke the `p` method on line 5
and pass `number` as the argument, the next output is `3`. Then on line 6 when we invoke the `shift`
method on the `numbers` array, it will remove the first element within the array, which is the Integer
`2`. Our `numbers` array now references the array: `[3, 4]`. And because the array now only has two 
elements; the `each` method is now done executing, and then returns the new mutated array that `numbers`
references which is `[3, 4]`.
=end

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

=begin
This code will output: `1` `2` ; on separate lines. 
On the first iteration `number` will reference the `0` indexed element; which is the Integer `1`. Which is
why `1` gets output when we invoke the `p` method on `number` on line 27. Then on line 28 when we invoke
the `pop` method on `numbers` it will mutate our original array by removing the last element. `numbers` 
now references the array: `[1, 2, 3]`. So then on the second iteration `number` will reference the `1`
indexed element; which is the Integer `2`. Which is why when we invoke the `p` method on line 28 and pass
`number` as the argument, the next output is `2`. Then on line 28 when we invoke the `shift` method on
the `numbers` array, it will remove the last element within the array, which is the Integer `3`. Our 
`numbers` array now references the array: `[1, 2]`. And because the array now only has two elements; the
`each` method is now done executing, and then returns the new mutated array that `numbers` references
which is `[1, 2]`.
=end