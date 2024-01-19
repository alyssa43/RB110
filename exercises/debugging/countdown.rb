# Our countdown to launch isn't behaving as expected. Why? Change the code so 
# that our program successfully counts down from 10 to 1.

# def decrease(counter)
#   counter -= 1
# end

# counter = 10

# 10.times do
#   puts counter
#   decrease(counter)
# end

# puts 'LAUNCH!'

This code isn't working as expected because we are dealing with two different local
variables called `counter`. One we initialize on line 5, in the outer most scope of
our program, and the other we initialize inside our `decrease` method. Meaning these
variables are not within the same scope as each other.

However, when we invoke the `decrease` method on line 9, and pass our outer scoped
local variable `counter` as the argument, both `counter` variables will be referencing
the same object. Which in this case is the Integer `10`. 

But, because we immediately reassign the value of the `counter` variable that is within
the `decrease` methods scope (and reassignment does not mutate the calling object), the
outer scoped `counter` variable is no longer referencing the same object as the `counter`
variable within the `decrease` method. Which means both `counter` variables are now 
referencing different objects, and the outer scoped `counter` variable will not be mutated.

I fixed this code by simply reassigning the outer scoped local variable `counter`
to reference the return value of invoking the `decrease` method with the outer scoped
`counter` variable as the argument.


def decrease(counter)
  counter -= 1
end

counter = 10

counter.times do 
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH'