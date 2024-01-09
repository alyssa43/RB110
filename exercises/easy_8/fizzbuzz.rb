# Write a method that takes two arguments: the first is the starting number, 
# and the second is the ending number. Print out all numbers from the starting 
# number to the ending number, except if a number is divisible by 3, print 
# "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number 
# is divisible by 3 and 5, print "FizzBuzz".

# Example:
# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

def fizzbuzz(num1, num2)
  result = (num1..num2).to_a.map do |num|
    case 
    when num % 3 == 0 && num % 5 == 0 then "Fizzbuzz"
    when num % 3 == 0 then "Fizz"
    when num % 5 == 0 then "Buzz"
    else num
    end
  end
  puts result.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz