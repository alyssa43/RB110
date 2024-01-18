# Write a method that takes an Array as an argument, and sorts that Array using 
# the bubble sort algorithm as just described. Note that your sort will be 
# "in-place"; that is, you will mutate the Array passed as an argument. You may 
# assume that the Array contains at least 2 elements.

# Examples
# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

def swap?(arr)
  arr.each_index do |i|
    break if i == arr.index(arr[-1])
    return true if arr[i] > arr[i + 1]
  end
  false
end

def bubble_sort!(arr)
  i = 0
  loop do
    break if swap?(arr) == false
    i = 0 if i == arr.index(arr[-1])
    arr[i], arr[i + 1] = arr[i + 1], arr[i] if arr[i] > arr[i + 1]
    i += 1
  end
  arr
end

p array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)