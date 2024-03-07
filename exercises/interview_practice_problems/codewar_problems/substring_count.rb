=begin
problem: given two strings, where the first represents full text that will be searched 
and the second represents the partial text that is to be matched within the first full
text; return an integer that is equal to the number of times the partial text is found
within the full text
  - input:
    - string
    - string
  - output: integer
  -rules:
    - partial text must match exactly (no overlap)
example:
  - if input if 'abbcdbbbeb' and 'bb' we would return `2` because we are counting the
  number of occurrences 'bb' appears within full text 
data structure:
  - starting: string & string
    - intermediate: string and regex -> array
  - ending: integer
algorithm:
  - separate all occurrences of search_text from within full_text
  - count number of occurrences
    - return number of occurrences
=end

def solution(full_text, search_text)
  full_text.scan(/#{search_text}/).count
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

# completed 3/6/2024 in 10 minutes