require 'rspec'
require 'categories'
require 'PG'
require 'pry'

# DB = PG.connect({:dbname => 'expense_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
  DB.exec("DELETE FROM categories *;")
  end
end

describe 'Categories' do
  describe 'initialize' do
    it 'initializes an instance of a category' do
      test_categories = Categories.new({:name => 'Fun'})
      test_categories.should be_an_instance_of Categories
    end
  end

  describe '.all' do
    it 'starts off as an empty array with no categories in it' do
      Categories.all.should eq []
    end

    it 'turns every database entry into an object' do
      test_categories = Categories.new({:name => 'Car'})
      test_categories.save
      Categories.all[0].should be_an_instance_of Categories
    end
  end

  describe 'save' do
    it 'saves an instance of categories to the array' do
      test_categories = Categories.new({:name => 'Bills'})
      test_categories.save
      Categories.all.should eq [test_categories]
    end
  end

  describe '.create' do
    it 'Creates and saves an instance of categories' do
      test_categories = Categories.create('Interesting Stuff')
      test_categories.should be_an_instance_of Categories
    end
  end

  describe 'delete' do
    it 'deletes an entry from the database' do
      test_categories = Categories.create('Travel')
      test_categories.delete
      Categories.all.should eq []
    end
  end

end

