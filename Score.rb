VALID_CHOICES = %w(rock paper scissors lizard spock)
hash_input = { 'l' => 'lizard', 'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors', 'sp' => 'spock' }
WINNER  = { 'lizard' => ['paper', 'spock'] , 'rock' => ['scissors', 'lizard'], 
'paper' => ['rock', 'spock'], 'scissors' => ['paper', 'lizard'], 'spock' => ['scissors', 'rock'] }
SYMBOL = { player: 0, computer: 0, draws: 0 }

if win?(player, computer)
  SYMBOL[player] += 1
elsif win?(computer, player)
  SYMBOL[computer] += 1
else
  SYMBOL[draw] += 1
  end_game
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(player, computer)
  win_on = WINNER[player]
  win_on.include?(computer)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

loop do
  if SYMBOL[player] == 5 || SYMBOL[computer] == 5
  end
end

if win?(player, computer)
  prompt('You score 1 point')
  SYMBOL[:player] += 1
elsif win?(computer, player)
  prompt('Computer score 1 point')
  SYMBOL[:computer] += 1
else
  prompt('Each score 1 point')
  SYMBOL[:draw] += 1
  end_game
end

loop do
  choice = ' '
  real_choice = nil

loop do
  prompt("Choose one: #{VALID_CHOICES.join(',')}, ==> #{hash_input}")
  choice = Kernel.gets.chomp
  real_choice = hash_input.fetch(choice, choice)

if VALID_CHOICES.include?(real_choice)
  break
else
  prompt("That's not a valid choice.")
end
end

  computer_choice = VALID_CHOICES.sample
  prompt("You chose: #{real_choice}; Computer chose: #{computer_choice}")
  display_results(real_choice, computer_choice)
  calculate_winner(player_score, computer_score)

  prompt('Do you want to play again? Y to do so')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing. Good bye!')
