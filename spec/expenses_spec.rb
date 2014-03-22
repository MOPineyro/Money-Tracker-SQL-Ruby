require 'spec_helper'

describe Expense do
  describe 'initialize' do
    it 'creates an instance of an expenses' do
      test_expense = Expense.new({:description => 'Mead', :amount => 6.00, :date => '1212-11-13'})
      test_expense.should be_an_instance_of Expense
    end
  end

  describe '.all' do
    it 'will begin with an empty array' do
      Expense.all.should eq []
    end
  end

  describe 'save' do
    it 'saves an expense' do
      test_expense = Expense.new({:description => 'Mead', :amount => 6.00, :date => '1212-10-07'})
      test_expense.save
      Expense.all.should eq [test_expense]
    end
  end

  describe '.create' do
    it 'creates a new class and saves it' do
      test_expense = Expense.create({ :amount => 96.76, :description => 'unicorn rides', :date => '2099-01-11'})
      test_expense.description.should eq 'unicorn rides'
    end
  end

  describe '==' do
    it 'is the same if two or more expenses are the same in every way' do
      test_expense1 = Expense.new({:description => 'Mead', :amount => 6.00, :date => '1212-10-07'})
      test_expense2 = Expense.new({:description => 'Mead', :amount => 6.00, :date => '1212-10-07'})
      test_expense1.should eq test_expense2
    end
  end


end
