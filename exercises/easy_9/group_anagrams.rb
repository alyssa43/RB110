# Given the array...

# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon']
# Write a program that prints out groups of words that are anagrams. 
# Anagrams are words that have the same exact letters in them but in 
# a different order. Your output should look something like this:


# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)

def group_anagrams(list)
  anagrams = {}
  sorted_words = list.map { |word| [word.chars.sort.join] + [word] }
  sorted_words.each do |sorted_word, word|
    if anagrams.key?(sorted_word)
      anagrams[sorted_word] << word
    else
      anagrams[sorted_word] = [word]
    end
  end
  anagrams.values
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

p group_anagrams(words)