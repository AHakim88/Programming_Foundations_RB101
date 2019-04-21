def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_access_username
  prompt('Hi please enter your username for verification:')
end

def valid_num(input)
  input.to_f.to_s == input || input.to_i.to_s == input
end

def loan_amount(amount)
  valid_num(amount) && amount.to_f >= 0
end

def apr_amount(rate)
  valid_num(rate) && rate.to_f >= 0 && rate.to_f < 100
end

def loan_duration(duration)
  valid_num(duration) && duration.to_i >= 0 && duration.to_i.to_s == duration
end

def display_loan_insert
  prompt('Please enter amount of loan: ')
end

def display_username_error
  prompt('Kindly insert the correct username:')
end

def display_loan_amount_error
  prompt('The amount is incorrect.
  Make sure only positive integer. Please try again.')
end

def display_apr_insert
  prompt('Enter apr (in percentage %):')
end

def display_apr_error
  prompt('Positive integer,zero and input less than 100 for the apr rate:')
end

def display_loan_duration
  prompt('Kindly insert the duration of the loan(in months):')
end

def display_loan_duration_error
  prompt('The duration of the month is incorrect. Please try again.')
end

def display_restart_program
  prompt('Do you want to run the program again?')
end

def extract_username
  username = ''
  loop do
    username = gets.chomp.strip
    if username.empty? || username.start_with?(' ')
      display_username_error
    else
      break
    end
  end
  username
end

def extract_loan_amount
  amount = ''
  loop do
    display_loan_insert
    amount = Kernel.gets.chomp
    break if loan_amount(amount)
    display_loan_amount_error
  end
end

def extract_apr_rate
  rate = ''
  loop do
    display_apr_insert
    rate = Kernel.gets.chomp
    break if apr_amount(rate)
    display_apr_error
  end
end

def extract_loan_duration
  duration = ''
  loop do
    display_loan_duration
    duration = Kernel.gets.chomp
    break if loan_duration(duration)
    display_loan_duration_error
  end
end

def extract_user_response
  user_response = ''
  loop do
    display_restart_program
    user_response = gets.chomp.downcase
    break if user_response != 'y'
  end
end

loop do
  display_access_username

  name = extract_username
  prompt("Hi #{name}, thank you for verifying your username.
Welcome to your online loan calculator!")

  amount = extract_loan_amount
  rate = extract_apr_rate
  duration = extract_loan_duration

  amount_loan = amount.to_f
  monthly_rate = (rate.to_f / 100) / 12
  loan_duration = duration.to_i

  monthly_repayment = amount_loan *
                   (monthly_rate / (1 - (1 + monthly_rate)**-loan_duration))

  prompt("Your monthly payment is $#{monthly_repayment.round(2)}")

  prompt('Would you like to try again? Y/N')
  user_input = Kernel.gets.chomp
  break if user_input.downcase == 'n'
end
