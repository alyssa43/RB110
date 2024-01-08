# Modify the method from the previous exercise so it ignores non-alphabetic characters when 
# determining whether it should uppercase or lowercase each letter. The non-alphabetic 
# characters should still be included in the return value; they just don't count when 
# toggling the desired case.

# Example:
# staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

ALPHABET = ('a'..'z').to_a

def staggered_case(str)
  upcase = false
  str.chars.map do |char|
    next char unless ALPHABET.include?(char.downcase)
    upcase = !upcase
    upcase ? char.upcase : char.downcase
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'