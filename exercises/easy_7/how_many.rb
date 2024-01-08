# Write a method that counts the number of occurrences of each element in a given array.

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)
# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each 
# element alongside the number of occurrences.

# Expected output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(arr)
  vehicle_count = arr.each_with_object(Hash.new(0)) do |vehicle, hsh|
    hsh[vehicle] += 1
  end
  
  vehicle_count.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end

# Further Exploration
def count_occurrences(arr)
  vehicle_count = arr.each_with_object(Hash.new(0)) do |vehicle, hsh|
    hsh[vehicle.downcase] += 1
  end

  vehicle_count.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end


count_occurrences(vehicles)