require 'pry'

DISPLAY_LENGTH = 80
DELAY = 1.5

CARD_SUITS = %w(Hearts Diamonds Spades Clubs)
CARD_RANK = %w(2 3 4 5 6 7 8 9 10 J Q K A)
CARD_SYMBOLS = { "Hearts" => "\u2665", "Diamonds" => "\u2666",
                 "Spades" => "\u2660", "Clubs" => "\u2663",
                 "Hidden" => "\u2754" }

DEALER_MIN = 17
MAX_SCORE = 21

# ---------- DISPLAY METHODS ----------

def prompt(msg)
  puts "=> #{msg}"
end

def display_empty_line
  puts ''
end

def center_display(display)
  puts display.center(DISPLAY_LENGTH)
end

def display_divider
  display_empty_line
  puts '=' * DISPLAY_LENGTH
  display_empty_line
end

def display_welcome_message
  system 'clear'
  display_empty_line
  center_display("-----> Welcome to Twenty-One <-----")
  display_divider
  puts <<~WELCOME

    In the game of Twenty-One the goal is to score as close to 21 points as
    possible without going over 21.

    WELCOME
end

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
def display_cards(cards)
  size = cards.size
  ranks = []
  symbols = []

  cards.each do |card|
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
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength

def display_players_hand(cards)
  center_display("-----> PLAYER <-----")
  display_cards(cards)
  display_total_points(cards)
end

def display_dealers_hand(cards, hidden)
  center_display("-----> DEALER <-----")
  if hidden
    display_cards(hide_card(cards))
    display_total_points(cards[0])
  else
    display_cards(cards)
    display_total_points(cards)
  end
end

def display_total_points(cards)
  center_display("Current Total: #{calculate_total_points(cards)}")
end

def display_game_board(players_hand, dealers_hand, hidden)
  system 'clear'
  display_empty_line
  display_players_hand(players_hand)
  display_divider
  display_dealers_hand(dealers_hand, hidden)
  display_empty_line
end

def display_winner(players_hand, dealers_hand)
  players_score = calculate_total_points(players_hand)
  dealers_score = calculate_total_points(dealers_hand)
  display_empty_line
  if busted?(players_hand)
    puts "You busted. Dealer wins!"
  elsif busted?(dealers_hand)
    puts "Dealer busted. You win!"
  elsif players_score > dealers_score
    puts "You win!"
  elsif dealers_score > players_score
    puts "Dealer wins!"
  else
    puts "Push. It's a tie!"
  end
end

# ---------- HELPER METHODS ----------

def hide_card(cards)
  [cards[0], ["\u2754", "Hidden"]]
end

def calculate_card_value(rank)
  if rank == 'A'
    11
  elsif rank == 'K' || rank == 'Q' || rank == 'J'
    10
  else
    rank.to_i
  end
end

def calculate_total_points(cards)
  ranks = []
  points = 0
  if cards.flatten.size == 2
    ranks = cards[0]
    points = calculate_card_value(ranks)
  else
    ranks = cards.map { |card| card[0] }
    ranks.each { |rank| points += calculate_card_value(rank) }
  end

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
    break if answer.start_with?('h') || answer.start_with?('s')
    puts "Invalid input, please try again"
  end
  answer.start_with?('h')
end

def busted?(cards)
  calculate_total_points(cards) > MAX_SCORE
end

# rubocop:disable Metrics/MethodLength
def players_turn(players_hand, dealers_hand, deck)
  loop do
    display_game_board(players_hand, dealers_hand, true)
    if busted?(players_hand)
      puts "You busted!"
      sleep DELAY
      break
    elsif calculate_total_points(players_hand) == 21
      puts "21! Now it's the dealer's turn."
      sleep DELAY
      break
    elsif hit?
      puts "dealing.."
      sleep DELAY
      players_hand << deal!(deck)
    else
      puts "You have decided to stay. Now it's the dealer's turn."
      sleep DELAY
      break
    end
  end
end
# rubocop:enable Metrics/MethodLength

def dealers_turn(dealers_hand, players_hand, deck)
  loop do
    display_game_board(players_hand, dealers_hand, false)
    if calculate_total_points(dealers_hand) < 17
      puts "dealing.."
      sleep DELAY
      dealers_hand << deal!(deck)
    else
      break
    end
  end
end

# MAIN GAME LOOP

display_welcome_message
prompt "Push any button when you are ready to start playing"
gets.chomp
system 'clear'

# grand_scores = { "Player" => 0, "Dealer" => 0 }

loop do
  deck = initialize_deck
  players_hand = deal!(deck)
  dealers_hand = deal!(deck)

  players_turn(players_hand, dealers_hand, deck)
  if busted?(players_hand)
    display_game_board(players_hand, dealers_hand, false)
  else
    dealers_turn(dealers_hand, players_hand, deck)
  end
  display_winner(players_hand, dealers_hand)

  prompt "Push enter to play next game or 'Q' to quit"
  answer = gets.chomp.downcase
  break if answer.start_with?('q')
  puts "Shuffling for next game.."
  sleep DELAY
end
puts "Thanks for playing Twenty-One. Goodbye!"
