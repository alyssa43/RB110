# Write a method that takes a single String argument and returns a new string that 
# contains the original value of the argument with the first character of every 
# word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# Examples
# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Initial Solution:
def word_cap(str)
  str.split.map { |word| word.capitalize }.join(' ')
end

# Further Exploration 1:
def word_cap(str)
  str.split.map { |word| word[0].upcase + word[1..-1].downcase }.join(' ')
end

# Further Exploration 2:
def word_cap(str)
  new_str = ''
  str.split.map { |word| word.chars }.each do |arr|
    arr.each_with_index do |char, i|
      if i == 0
        new_str << ' ' + char.upcase
      else
        new_str << char.downcase
      end
    end
  end
  new_str.delete_prefix(' ')
end
 

p word_cap('four score and seven') #== 'Four Score And Seven'
p word_cap('the javaScript language') #== 'The Javascript Language'
p word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'