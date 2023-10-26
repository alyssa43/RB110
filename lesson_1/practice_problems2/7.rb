# Create a hash that expresses the frequency with which each letter occurs in this string:
# Example: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

statement = "The Flintstones Rock"
character_count = Hash.new(0)

statement.each_char do |char|
	character_count[char] += 1
end

p character_count