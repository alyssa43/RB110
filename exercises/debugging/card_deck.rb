# We started working on a card game but got stuck. Check out why the code below raises a TypeError.

# Once you get the program to run and produce a sum, you might notice that the sum 
# is off: It's lower than it should be. Why is that?

CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace].freeze

deck = { :hearts   => CARDS.dup,
         :diamonds => CARDS.dup,
         :clubs    => CARDS.dup,
         :spades   => CARDS.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.values.flatten.map { |card| score(card) }.sum

puts sum
