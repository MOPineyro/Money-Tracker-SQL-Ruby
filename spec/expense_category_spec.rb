require 'rspec'
require 'expense_category'
require 'expense'
require 'categories'
require 'PG'
require 'pry'

DB = PG.connect({:dbname => 'expense_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
  DB.exec("DELETE FROM expense_category *;")
  end
end

describe Expense_Category do

  describe '.create' do
    it 'creates an instance of Expense_category by grabbing category.id and expense.id' do
      test_cat = Categories.create('Fun')
      test_expense = Expense.create('Eat Pho', '$1,000', '2014-02-1')
      test_expense_category = Expense_Category.create(test_cat.id, test_expense.id)
      test_expense_category.should be_an_instance_of Expense_Category
      test_expense_category.category_id.should eq test_cat.id
      test_expense_category.expense_id.should eq test_expense.id
    end
  end

end
