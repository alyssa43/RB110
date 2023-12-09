require 'pry'
require 'abbrev'

CARD_SUITS = %w(Hearts Diamonds Spades Clubs)
CARD_RANK = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
CARD_SYMBOLS = { "Hearts" => "\u2665", "Diamonds" => "\u2666", "Spades" => "\u2660", "Clubs" => "\u2663", "Hidden" => "\u2754"}

def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome_message
  system 'clear'
  puts "---> Welcome to Twenty-One <---"
  puts <<~WELCOME

    In the game of Twenty-One the goal is to score as close to 21 points as
    possible without going over 21.

    WELCOME
end

def display_cards(cards)
  size = cards.size
  ranks = []
  symbols = []

  cards. each do |card|
    ranks << card[0]
    symbols << CARD_SYMBOLS[card[1]]
  end

  puts "┌──────────┐ " * size
  puts " %s           " * size % ranks
  puts "│          │ " * size
  puts "│          │ " * size
  puts "     %s       " * size % symbols
  puts "│          │ " * size
  puts "│          │ " * size
  puts "         %s   " * size % ranks
  puts "└──────────┘ " * size
end

def initialize_deck
  new_deck = []
  CARD_RANK.each do |card|
    CARD_SUITS.each do |suit|
      new_deck << [card, suit]
    end
  end
  new_deck
end

def joinor(arr, punc = ', ', wrd = 'or')
  str = ''
  case arr.length
  when 1 then str += arr[0].to_s
  when 2 then str += arr.join(" #{wrd} ")
  else arr.each_with_index do |num, i|
    str += (arr.length == i + 1 ? "#{wrd} #{num}" : "#{num}#{punc}")
  end
  end
  str
end

def deal_cards(deck)
  deck.size < 50 ? deck.pop : deck.shuffle!.pop(2)
end

def hide_card(cards)
  [cards[0], ["\u2754", "Hidden"]]
end

def calculate_total_points(cards)
  points = []
  cards.each do |card|
    points << card[0]
  end
end

  
def calculate_aces(cards)
  # if cards total > 21 && cards.include?{"A"}
    # ace = 1
end

def someone_won?(players_hand, dealers_hand)
  false
end

# MAIN GAME LOOP

display_welcome_message
prompt "Push any button when you are ready to start playing"
gets.chomp
system 'clear'

loop do
  deck = initialize_deck
  players_hand = deal_cards(deck)
  dealers_hand = deal_cards(deck)

  puts "You have: #{players_hand[0][0]} and #{players_hand[1][0]}"
  puts "Total points: #{}"
  display_cards(players_hand)
  puts "Dealer has: #{dealers_hand[0][0]} and a hidden card."
  display_cards(hide_card(dealers_hand))
  break
end
