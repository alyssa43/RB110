# Given the array below, turn the array into a hash where the names are the keys and the values are
# the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hsh = {}
count = 0

loop do
	break if count == flintstones.size
	flintstones_hsh[flintstones[count]] = count
	count += 1
end

p flintstones_hsh