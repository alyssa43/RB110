# Write a method that takes a string, and then returns a hash that contains 3 entries:
# one represents the number of characters in the string that are lowercase letters, 
# one represents the number of characters that are uppercase letters, and one represents 
# the number of characters that are neither.

# Examples
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

UPPERCASE_LETTERS = ('A'..'Z').to_a
LOWERCASE_LETTERS = ('a'..'z').to_a

def letter_case_count(str)
  case_counter = {lowercase: 0, uppercase: 0, neither: 0}
  str.chars.each do |char|
    if UPPERCASE_LETTERS.include?(char)
      case_counter[:uppercase] += 1
    elsif LOWERCASE_LETTERS.include?(char)
      case_counter[:lowercase] += 1
    else
      case_counter[:neither] += 1
    end
  end
  case_counter
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }