require 'pg'
require './lib/expenses'
require './lib/category'

DB = PG.connect({:dbname => 'expense_organizer'})

def main_menu
  system('clear')
  puts "***************************************************************************"
  puts "*               TARA AND MARTY's INHERITED EXPENSE TRACKER                *"
  puts "*  copyright 1212 - we hold no liability for the outcome of this tracker  *"
  puts "***************************************************************************"
  puts "\n\nWhat doth you spend your loot on, homie?"
  puts "Press c to create a new category."
  puts "Press a to add an expense."
  puts "Press l to list expenses"
  puts "Press lc to list categories"
  puts "Press x to exit."

  main_choice = gets.chomp
  case main_choice
    when 'c' then add_category
    when 'a' then add_expense_ui
    when 'lc' then list_categories_ui
    when 'l' then list_expenses_ui
    when 'x' then puts "Fucketh off, then!"
      exit
    else
      puts "What thou speaketh 'bout, Willis?"
      main_menu
  end
end

def list_expenses_ui
  list_expenses
end

def list_expenses
  Expense.all.each_with_index do |expense, index|
    puts "#{index+1}. #{expense.description} | $#{expense.amount} | #{expense.date}"
  end
end

def list_categories_ui
  list_categories


  puts "What do you want to do?  d to delete a category.  M to go to main menu."


  case gets.chomp
  when 'd'
    delete_category
  else main_menu
  end
end

def delete_category
  system('clear')
  list_categories
  "Type the name of the category you want to delete or type go back to go back"
  category_to_be_deleted = gets.chomp
  case category_to_be_deleted
  when 'go back'
    main_menu
  else
    DB.exec("DELETE FROM category WHERE name = '#{category_to_be_deleted}';")
    main_menu
  end
end

def list_categories
  Category.all.each do |category|
    puts "#{category.name} || id = #{category.category_id}"
  end
end

def add_category
  puts "Name new category:"
  new_category = gets.chomp
  Category.create({'name' => new_category})
  main_menu
end

def add_expense_ui
  puts "What category will this expense go in (please input the category's id)?"
  list_categories
  category_id_of_expense = gets.chomp

  puts "What did thee spend thou coins upon?"
  description_entry = gets.chomp
  puts "What amount didst thou give to the squire?"
  amount_entry = gets.chomp.to_f
  puts "On whither fine 'morrow did this exceptional purchase occur?"
  date_entry = gets.chomp
  puts "Your coins have gone hither: '#{description_entry}' for #{amount_entry} coins on this fine morrow: #{date_entry}"


  add_expense(amount_entry, description_entry, date_entry)


  # puts @new_expense.id
  puts category_id_of_expense


  sleep(4)
  main_menu
end

def add_expense(amount, description, date)
  @new_expense = Expense.create({:description => description, :amount => amount, :date => date})
end


main_menu

