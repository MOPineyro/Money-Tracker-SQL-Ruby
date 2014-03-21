require 'pg'
require 'rspec'
require 'expenses'
require 'category'

DB = PG.connect({:dbname => 'expense_organizer_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")
    DB.exec("DELETE FROM category *;")
  end
end
