ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a

def letter_percentages(str)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  str.chars.each do |char|
    if !ALPHABET.include?(char)
      result[:neither] += 1.0
    elsif char == char.upcase
      result[:uppercase] += 1.0
    else
      result[:lowercase] += 1.0
    end
  end
  result.transform_values { |count| ((count / str.size) * 100).round(1) }
end

p letter_percentages('abcdefGHI')

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }