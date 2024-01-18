def balanced?(str)
  result = 0
  str.chars.each do |char|
    case char
    when '(' then result += 1
    when ')' then result -= 1
    end
    return false if result.negative?
  end
  result == 0 
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false