# In this kata, you've to count lowercase letters in a given string and return the letter 
# count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead 
# of string in Ruby and 'char' instead of string in Crystal.

# Example:

# letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

=begin
problem: given a string, return a hash whose keys are each LOWERCASE character and whose values are
  the number of occurrences the character appears in the input string.
  - input: string
  - output: hash

  - rules:
    - all input strings will be lowercase
    - do not have to account for spaces or punctuation
    - returned hash is in alphabetical order
    - returned hashes keys must be a symbol
    
example:
  - if input is 'activity' we will return {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}). Because 
  'a' occurs 1 time, 'c' occurs 1 time, 'i' occurs 2 times, 't' occurs 2 times, 'v' occurs 1 time
  and 'y' occurs 1 time

data structure:
  - starting: string
  - intermediate: array where each element is a character from the input string
  - ending: hash

algorithm:
  - create an array where each element is a character from the input string
    - sort the character array in alphabetical order
  - iterate through the sorted character array
    - create a hash where the key is the character transformed into a symbol and whose value is 
    incremented by 1 with each occurrence.
  - return that hash
=end

def letter_count(string)
  string.chars.sort.each_with_object(Hash.new(0)) do |char, hsh|
    hsh[char.to_sym] += 1
  end
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# Completed 3/5/2024 in 12 minutes

