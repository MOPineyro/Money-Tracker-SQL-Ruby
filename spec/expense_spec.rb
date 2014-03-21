require 'rspec'
require 'expense'
require 'PG'
require 'pry'

DB = PG.connect({:dbname => 'expense_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
  DB.exec("DELETE FROM expenses *;")
  end
end

describe 'Expense' do
  describe 'initialize' do
    it 'initializes an instance of expense object with description, amount, and date' do
      test_expense = Expense.new({:description => 'Coffee', :amount => '$2.25', :date => '2014-03-21'})
      test_expense.should be_an_instance_of Expense
      test_expense.description.should eq 'Coffee'
      test_expense.amount.should eq '$2.25'
      test_expense.date.should eq '2014-03-21'
    end
  end

  describe '.all' do
    it 'starts off as an empty array with no expenses in it' do
      Expense.all.should eq []
    end

    it 'turns every database entry into an object' do
      test_expense = Expense.new({:description => 'Plane tickets', :amount => '$250.00', :date => '2014-04-01'})
      test_expense.save
      Expense.all[0].should be_an_instance_of Expense
    end
  end

  describe 'save' do
    it 'saves an instance of Expense to the array' do
      test_expense = Expense.new({:description => 'Plane tickets', :amount => '$250.00', :date => '2014-04-01'})
      test_expense.save
      Expense.all.should eq [test_expense]
    end
  end

  describe '.create' do
    it 'Creates and saves an instance of Expense' do
      test_expense = Expense.create('Boogers','$2.00','2014-02-17')
      test_expense.should be_an_instance_of Expense
    end
  end

  describe 'delete' do
    it 'deletes an entry from the database' do
      test_expense = Expense.create('Plane tickets','$250.00','2014-04-01')
      test_expense.delete
      Expense.all.should eq []
    end
  end

end

