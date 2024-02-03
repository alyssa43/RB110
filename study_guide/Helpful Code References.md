<h3>Helpful Code References</h3>

* Creating a hash to count alphabet characters :

  ```ruby
  ('a'..'z').each_with_object({}) do |letters, hash|
  	hash[letters] = 0
  end
  ```

  OR...to create AND use a collection Hash :

  ```ruby
  letters.each_with_object(Hash.new(0)) do |letter, hsh|
      hsh[letter] += 1
    end
  # letters should contain an array of each letter to be counted
  ```

* Removing all whitespace and punctuation from a String :

  ```ruby
  string.gsub(/\W/, '')
  ```

* Using `regex` and `String#scan` to split string into an array where spaces and punctuation are split as well as words. 

  ```ruby
  str.scan(/\w+|\W+/)
  
  # More detailed example:
  STR_DIGITS = { 
    'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
    'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9 
  }.freeze
  
  def word_to_digit(str_message)
    str_message.scan(/\w+|\W+/).map do |str|
      STR_DIGITS.include?(str) ? STR_DIGITS[str] : str
    end.join
  end
  ```

* Formatting money :

  ```ruby
  "#{format("$%.2f, var_name")}"
  ```

* Formatting time : 

  ```ruby
  format('%02d:%02d', hours, minutes)
  # OR
  "#{format('%02d', hours)}:#{format('%02d', minutes)}"
  ```
  
  