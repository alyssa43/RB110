require 'pry'

DISPLAY_LENGTH = 80

CARD_SUITS = %w(Hearts Diamonds Spades Clubs)
CARD_RANK = %w(2 3 4 5 6 7 8 9 10 J Q K A)
CARD_SYMBOLS = {"Hearts" => "\u2665", "Diamonds" => "\u2666", "Spades" => "\u2660", "Clubs" => "\u2663", "Hidden" => "\u2754"}

DEALER_MIN = 17
MAX_SCORE = 21

# ---------- DISPLAY METHODS ----------

def prompt(msg)
  puts "=> #{msg}"
end

def center_display(display)
  puts display.center(DISPLAY_LENGTH)
end

def display_divider
  puts ''
  puts '=' * DISPLAY_LENGTH
  puts ''
end

def display_welcome_message
  system 'clear'
  center_display("Welcome to Twenty-One")
  display_divider
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

  center_display "┌──────────┐ " * size
  center_display " %s           " * size % ranks
  center_display "│          │ " * size
  center_display "│          │ " * size
  center_display "     %s       " * size % symbols
  center_display "│          │ " * size
  center_display "│          │ " * size
  center_display "         %s   " * size % ranks
  center_display "└──────────┘ " * size
end

def display_players_hand(cards)
  ranks = cards.map { |card| card[0] }
  center_display("-----> PLAYER <-----")
  display_cards(cards)
  display_total_points(cards)
end

def display_dealers_hand(cards, hidden = true)
  center_display("-----> DEALER <-----")
  display_cards(hide_card(cards))
  hidden ? display_total_points(cards[0]) : display_total_points(cards)
end

def display_total_points(cards)
  center_display("Current Total: #{calculate_total_points(cards)}")
end

# ---------- HELPER METHODS ----------

def hide_card(cards)
  [cards[0], ["\u2754", "Hidden"]]
end

def join(arr)
  str = ''
  case arr.length
  when 1 then str += arr[0]
  when 2 then str += arr.join(" and ")
  else arr.each_with_index do |rank, i|
    str += (arr.length == i + 1 ? "and #{rank}" : ", #{rank}")
  end
  end
  str
end

def calculate_card_value(rank)
  case rank
  when 'A' then 11
  when 'K' then 10
  when 'Q' then 10
  when 'J' then 10
  else rank.to_i
  end
end

def calculate_total_points(cards)
  ranks = cards.map { |card| card[0] }
  points = 0

  ranks.each { |rank| points += calculate_card_value(rank) }

  ranks.count('A').times { points -= 10 if points > MAX_SCORE }

  points
end

# ---------- GAME PLAY METHODS ----------

def initialize_deck
  new_deck = []
  CARD_RANK.each do |card|
    CARD_SUITS.each do |suit|
      new_deck << [card, suit]
    end
  end
  new_deck
end

def deal!(deck)
  deck.size < 50 ? deck.pop : deck.shuffle!.pop(2)
end

def hit?
  answer = ''
  loop do
    prompt "Do you want to hit or stay ('h' or 's')"
    answer = gets.chomp.downcase
    break if answer == 'h' || answer == 's'
    puts "Invalid input, please try again"
  end
  answer == 'h'
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
  players_hand = deal!(deck)
  dealers_hand = deal!(deck)

  display_players_hand(players_hand)
  display_divider
  display_dealers_hand(dealers_hand)

  if hit?
    players_hand << deal!(deck)
    display_players_hand(players_hand)
    display_divider
    display_dealers_hand(dealers_hand)
  else
    display_players_hand(players_hand)
    display_divider
    display_dealers_hand(dealers_hand, false)
  end
  break
end
