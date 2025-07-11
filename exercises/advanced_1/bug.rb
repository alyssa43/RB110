def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([]) # == []
p my_method([3]) # == [21]
p my_method([3, 4]) # == [9, 16]
p my_method([5, 6, 7]) # == [25, 36, 49]

# The bug was on line 4, where `elsif` was missing a proper condition/body. Ruby treats the entire `array.map` invocation (and block) as the condition, this returns a new array which always evaluates as a truthy value. However, since there's no body following the condition, `nil` is implicitly returned as the value. By adding a proper condition (`array.size > 1`) ensures the correct branch is executed and returns the expected result.