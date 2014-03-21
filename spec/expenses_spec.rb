require 'spec_helper'

describe Expenses do
  describe 'initialize' do
    it 'creates an instance of an expenses' do
      test_expense = Expenses.new({:description => 'Mead', :amount => 6.00, :date => '1212-11-13', :category_id => 1})
      test_expense.should be_an_instance_of Expenses
    end
  end

  describe '.all' do
    it 'will begin with an empty array' do
      Expenses.all.should eq []
    end
  end

  describe 'save' do
    it 'saves an expense' do
      test_expense = Expenses.new({:description => 'Mead', :amount => 6.00, :date => '1212-10-07', :category_id => 1})
      test_expense.save
      Expenses.all.should eq [test_expense]
    end
  end

  describe '==' do
    it 'will remove any duplicate entries' do
      test_expense1 = Expenses.new({:description => 'Mead', :amount => 6.00, :date => '1212-10-07', :category_id => 1})
      test_expense2 = Expenses.new({:description => 'Mead', :amount => 6.00, :date => '1212-10-07', :category_id => 1})
      test_expense1.should eq test_expense2
    end
  end
end
