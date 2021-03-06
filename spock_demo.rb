VALID_CHOICES = %w(rock paper scissors lizard spock).freeze
HASH_INPUT = { 'l' => 'lizard', 'r' => 'rock', 'p' => 'paper',
               'sc' => 'scissors', 'sp' => 'spock' }.freeze
WINNER  = { 'lizard' => %w(paper spock), 'rock' => %w(scissors lizard),
            'paper' => %w(rock spock), 'scissors' => %w(paper lizard),
            'spock' => %w(scissors rock) }.freeze
@scores = { player: 0, computer: 0 }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_score_tally
  prompt("Your total score: #{@scores[:player]}
  & Computer total score: #{@scores[:computer]}")
end

def display_continue
  prompt('Do you want to continue playing? Y to do so')
end

def display_play_again
  prompt('Game has finished, would you like to play again? Y to do so')
end

def display_goodbye_message
  prompt('Thank you for playing. Good bye!')
end

def choose_winner(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    :player
  elsif win?(computer_choice, player_choice)
    :computer
  else
    nil
  end
end

def counting_scores(winner)
  case winner
  when :player
    @scores[:player] += 1
  when :computer
    @scores[:computer] += 1
  end
end

def display_results(winner)
  case winner
  when :player
    prompt('You won!')
  when :computer
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

def end_game
  return unless @scores[:player] == 5 || @scores[:computer] == 5
  display_play_again
  answer = Kernel.gets.chomp
  if answer.casecmp('y').zero?
    @scores = { player: 0, computer: 0 }
  else exit
  end
end

def overall_winner
  if @scores[:player] == 5
    prompt('Congratulations! You are the overall winner!!')
  elsif @scores[:computer] == 5
    prompt('Game over! Computer is the overall winner!!')
  end
end

def valid_choice(player_choice)
  if VALID_CHOICES.include?(player_choice)
    player_choice
  else prompt("That's not a valid choice.")
  end
end

def win?(player, computer)
  win_on = WINNER[player]
  win_on.include?(computer)
end

def select_user_choice
  choice = ' '
  player_choice = nil

loop do
  prompt("Choose one: #{VALID_CHOICES.join(',')}, ==> #{HASH_INPUT}")
  choice = Kernel.gets.chomp
  player_choice = HASH_INPUT.fetch(choice, choice)

  return player_choice if VALID_CHOICES.include?(player_choice)
  prompt("That's not a valid choice.")
end
end

loop do
  player_choice = select_user_choice

  computer_choice = VALID_CHOICES.sample
  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")

  winner = choose_winner(player_choice, computer_choice)
  display_results(winner)
  counting_scores(winner)
  display_score_tally
  overall_winner
  display_continue
  answer = Kernel.gets.chomp
  break unless answer.casecmp('y').zero?
  system('clear') || system('cls')
  end_game
end
display_goodbye_message
