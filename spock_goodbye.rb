VALID_CHOICES = %w(rock paper scissors lizard spock)
HASH_INPUT = { 'l' => 'lizard', 'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors', 'sp' => 'spock' }
WINNER  = { 'lizard' => ['paper', 'spock'] , 'rock' => ['scissors', 'lizard'],
'paper' => ['rock', 'spock'], 'scissors' => ['paper', 'lizard'], 'spock' => ['scissors', 'rock'] }
@scores = {player: 0, computer: 0}


def counting_scores(winner)
  case winner
  when :player
  @scores[:player] += 1
  when :computer
  @scores[:computer] += 1
  end
end


def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(player, computer)
  win_on = WINNER[player]
  win_on.include?(computer)
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
  loop do
    break if :player == 5|| :computer == 5
  end
end

def choose_winner(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    return :player
  elsif win?(computer_choice, player_choice)
    return :computer
  else
    return nil
  end
end

def get_user_choice
  choice = ' '
  player_choice = nil

loop do
    prompt("Choose one: #{VALID_CHOICES.join(',')}, ==> #{HASH_INPUT}")
  choice = Kernel.gets.chomp
  player_choice = HASH_INPUT.fetch(choice, choice)

  if VALID_CHOICES.include?(player_choice)
    return player_choice
  else prompt("That's not a valid choice.")
  end
  end 
end

  loop do
  player_choice = get_user_choice

  computer_choice = VALID_CHOICES.sample
  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")

  winner = choose_winner(player_choice, computer_choice)
  display_results(winner)
  counting_scores(winner)
  prompt ("Your total score: #{@scores[:player]}  |  Computer total score: #{@scores[:computer]}") 

  prompt('Do you want to play again? Y to do so')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing. Good bye!')
