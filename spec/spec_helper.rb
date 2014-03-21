require 'rspec'
require 'pg'
require 'expense_category'
require 'expense'
require 'categories'
require 'pry'

DB = PG.connect({:dbname => 'expense_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
  DB.exec("DELETE FROM categories *;")
  DB.exec("DELETE FROM expense *;")
  DB.exec("DELETE FROM expense_category *;")
  end
end
