def display_longest_sentence(str)
  puts str.split(/\.|\?|!/).sort_by { |sentence| sentence.size }.last
end

file = File.read("pg84.txt")

display_longest_sentence(file)