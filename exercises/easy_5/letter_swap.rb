def swap(str)
  str.split(' ').map do |word|
		next word if word.length == 1
		word[-1] + word[1..-2] + word[0]
	end.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'