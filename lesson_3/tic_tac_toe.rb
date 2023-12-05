require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Layout/LineLength
def display_scores(scores)
	prompt "You're an #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}."
  prompt "First player to score 5 points wins!"
  prompt "Your Score: #{scores['Player']} - Computer Score: #{scores['Computer']}"
end
# rubocop:enable Layout/LineLength

# rubocop:disable Metrics/AbcSize
def display_board(brd, scores)
  system 'clear'
  display_scores(scores)
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

def first_turn(game_count)
	answer = ''
	if game_count.even?
		loop do
			prompt "You can choose who goes first!"
			prompt "Choose 'P' for Player (you) -or- 'C' for Computer (me)"
			answer = gets.chomp.downcase
			break if answer == 'p' || answer == 'c'
			prompt "Invalid choice, please try again"
		end
	else
		answer = 'c'
	end
	answer
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


def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))} "
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice."
  end
  brd[square] = PLAYER_MARKER
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

def computer_places_piece!(brd)
	square = ''
	if detect_offensive_move?(brd) && !empty_offense_squares(brd).empty?
		square = empty_offense_squares(brd).sample
	elsif detect_threat?(brd) && !empty_defense_squares(brd).empty?
		square = empty_defense_squares(brd).sample
	elsif brd[5] == INITIAL_MARKER
		square = 5
	else
	 square = empty_squares(brd).sample
	end
	brd[square] = COMPUTER_MARKER
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
  display_board(board, scores)
  if winner == 'Player'
    prompt "Congratulations, you won!"
  else
    prompt "Computer wins"
  end
end

loop do # Loop One
  scores = { "Player" => 0, "Computer" => 0 }
	game_count = 0

  loop do # Loop Two
		system 'clear'
    board = initialize_board
		player_one = first_turn(game_count)

    if player_one == 'p'
			loop do 
				display_board(board, scores)
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)

        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
			end
		else
			loop do
			  computer_places_piece!(board)
				break if someone_won?(board) || board_full?(board)
				display_board(board, scores)

			  player_places_piece!(board)
			  break if someone_won?(board) || board_full?(board)
			end
		end

    if someone_won?(board)
      winner = detect_winner(board)
      update_score(scores, winner)
      display_winner(winner, board, scores)
    else
      display_board(board, scores)
      prompt "It's a tie!"
    end

		game_count += 1

    if scores.value?(5)
      grand_winner = scores.key(5)
      display_winner(grand_winner, board, scores)
      prompt " - GAME OVER -"
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

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
