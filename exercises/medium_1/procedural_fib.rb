# # My Solution
# def fibonacci(num)
#   return num if num < 2
#   result = 0
#   num1 = 0
#   num2 = 1
 
#   (num - 1).times do 
#     result = num1 + num2
#     num1 = num2
#     num2 = result
#   end
#   result
# end

# LS Solution
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075