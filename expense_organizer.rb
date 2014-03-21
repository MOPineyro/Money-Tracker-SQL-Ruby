def main_menu
  puts "~~~~Money Tracker~~~~"
  puts "A to add expenses."
  puts "C to add a category."
  puts "X to exit."

  selection = gets.chomp

  case selection
  when 'A'
    add_expenses
  when 'C'
    add_category
  when 'X'
    exit
  else
    main_menu
  end

def add_expenses
  puts "Enter the description of your expense:"
  description_input = gets.chomp
  puts "Enter the amount of your purchase:"
  amount_input = gets.chomp
  puts "Enter the date that this transaction occurred:"
  date_input = gets.chomp

  new_expense = Expense.create(description_input, amount_input, date_input)
end

end
