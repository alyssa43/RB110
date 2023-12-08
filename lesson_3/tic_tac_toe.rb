require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

LABELED_BOARD = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
                  6 => '6', 7 => '7', 8 => '8', 9 => '9' }

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome_message
  system 'clear'
  puts "---> Welcome to Tic Tac Toe <--- \n \n"
  puts <<~WELCOME
    In this game of Tic Tac Toe you will play against the computer, taking turns
    putting your marks in empty squares. The squares are numbered as followed:
    WELCOME
end

def display_rules
  puts <<~RULES
    The first player to get 3 of their marks in a row (up, down, across, or
    diagonally) is the winner of that round and recieves 1 point. We will
    take turns going first.

    If all 9 squares are full and no player has 3 marks in a row, that round
    ends in a tie and neither player gets a point.

    The first player to reach five points wins the game. Good luck!

  RULES
  prompt "Push any button to continue when you're ready to play!"
  gets.chomp
  system 'clear'
end

def display_scores(scores)
  system 'clear'
  puts "---> SCORE <---"
  puts "You: #{scores['Player']}"
  puts "Computer: #{scores['Computer']}"
  puts "You're an #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}."
  puts "First player to score 5 points wins!"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |     "
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def empty_defense_squares(brd)
  lines_to_defend = WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2
  end
  lines_to_defend.flatten.select { |square| brd[square] == INITIAL_MARKER }
end

def empty_offense_squares(brd)
  offense_lines = WINNING_LINES.select do |line|
    brd.values_at(*line).count(COMPUTER_MARKER) == 2
  end
  offense_lines.flatten.select { |square| brd[square] == INITIAL_MARKER }
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

def first_player(game_count)
  game_count.even? ? 'p' : 'c'
end

def detect_threat?(brd)
  threat = false
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      threat = true
    end
  end
  threat
end

def detect_offensive_move?(brd)
  offensive_move = false
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      offensive_move = true
    end
  end
  offensive_move
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))} "
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts "Sorry, that is not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = if detect_offensive_move?(brd) && !empty_offense_squares(brd).empty?
             empty_offense_squares(brd).sample
           elsif detect_threat?(brd) && !empty_defense_squares(brd).empty?
             empty_defense_squares(brd).sample
           elsif brd[5] == INITIAL_MARKER
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  player == 'p' ? player_places_piece!(brd) : computer_places_piece!(brd)
end

def alternate_player(current_player)
  current_player == 'p' ? 'c' : 'p'
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def update_score(score, winner)
  score[winner] += 1
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def display_winner(winner, board, scores)
  display_scores(scores)
  display_board(board)
  if winner == 'Player'
    puts "Congratulations, you won!"
  else
    puts "Computer wins"
  end
end

# Main Game Loop

display_welcome_message
display_board(LABELED_BOARD)
display_rules

loop do # Loop One
  scores = { "Player" => 0, "Computer" => 0 }
  game_count = 0

  loop do # Loop Two
    system 'clear'
    board = initialize_board
    current_player = first_player(game_count)

    loop do # Loop Three
      display_scores(scores)
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end # Loop Three

    game_count += 1

    if someone_won?(board)
      winner = detect_winner(board)
      update_score(scores, winner)
      display_winner(winner, board, scores)
    else
      display_scores(scores)
      display_board(board)
      puts "It's a tie!"
    end

    if scores.value?(5)
      grand_winner = scores.key(5)
      display_winner(grand_winner, board, scores)
      puts " ---> GAME OVER <---"
      break
    else
      prompt "Ready for next game? (y or n)"
      next_game = gets.chomp
      break unless next_game.downcase.start_with?('y')
    end
  end # Loop Two

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # Loop One

puts "Thanks for playing Tic Tac Toe! Goodbye!"
