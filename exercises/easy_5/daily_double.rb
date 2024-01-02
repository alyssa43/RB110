# Write a method that takes a string argument and returns a new string that contains the value
# of the original string with all consecutive duplicate characters collapsed into a single
#  character. You may not use String#squeeze or String#squeeze!.

# Examples:
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

def crunch(str)
  str.chars.select.with_index do |char, i|
    char != str.chars[i + 1]
  end.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''