# Using the each method, write some code to output all of the vowels from the strings.
VOWELS = %w[a e i o u]

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.values.each do |arr|
	arr.each do |word|
		word.chars.each do |char|
			puts char if VOWELS.include?(char)		# => Or could do `puts char if char =~ /[aeiou]/`
		end
	end
end
