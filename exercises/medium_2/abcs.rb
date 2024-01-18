# frozen_string_literal: true

BLOCK_LETTERS = [%w[B O], %w[X K], %w[D Q], %w[C P], %w[N A],
                 %w[G T], %w[R E], %w[F S], %w[J W], %w[H U], 
                 %w[V I], %w[L Y], %w[Z M]].freeze

def block_word?(str)
  block_letters = BLOCK_LETTERS.clone
  letter_count = str.upcase.chars.each_with_object(Hash.new(0)) do |letter, hsh|
    hsh[letter] += 1
  end
  block_letter_count = block_letters.map do |block_subarr|
    block_subarr.map { |letter| letter_count[letter] }.sum
  end
  block_letter_count.all? { |count| count < 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
