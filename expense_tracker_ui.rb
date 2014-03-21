require 'pg'
require './lib/expenses'

DB = PG.connect({:dbname => 'expense_organizer'})

def main_menu
  system('clear')
  puts "***************************************************************************"
  puts "*               TARA AND MARTY's INHERITED EXPENSE TRACKER                *"
  puts "*  copyright 1212 - we hold no liability for the outcome of this tracker  *"
  puts "***************************************************************************"
  puts "\n\nWhat doth you spend your loot on, homie?"
  puts "Press e to enter an expense."
  puts "Press x to exit."

  main_choice = gets.chomp
  case main_choice
    when 'e' then add_expense
    when 'x' then puts "Fucketh off, then!"
      exit
    else
      puts "What thou speaketh 'bout, Willis?"
      main_menu
  end
    main_menu
end

def add_expense
  puts "What did thee spend thou coins upon?"
  description_entry = gets.chomp "\n\n"
  puts "What amount didst thou give to the squire?"
  amount_entry = gets.chomp
  amount_entry.to_f
  "\n\n"
  puts "On whither fine 'morrow did this exceptional purchase occur?"
  date_entry = gets.chomp "\n\n"
  puts "Your coins have gone hither: ('#{@description_entry}') for (#{@amount_entry}) coins on this fine morrow: (#{@date_entry})"
  "\n\n"
  puts "Has't thou spent added coinage?"
  puts "Scribe y for added coinage expense."
  puts "Scribe n for nay."

  expense_choice = gets.chomp

  case expense_choice
    when 'y' then add_expense
    else main_menu
    end
end
main_menu
