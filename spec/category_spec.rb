require 'spec_helper'

describe Category do
  describe 'initialize' do
    it 'creates a new Category instance' do
      test_category = Category.new({ 'name' => 'Mexican Food'})
      test_category.should be_an_instance_of Category
    end

    it 'is initialized with a name' do
      test_category = Category.new({'name' => 'Mexican Food'})
      test_category.name.should eq 'Mexican Food'
    end
  end

  describe '.all' do
    it 'starts off with no Categories' do
      Category.all.should eq []
    end
  end

  describe 'save' do
    it 'stores each instance of a category in the database' do
      test_category = Category.new({ 'name' => 'Mexican Food' })
      test_category.save
      Category.all.should eq [test_category]
    end
  end
  describe '.create' do
    it 'initializes and saves a new instance of a category' do
      test_category = Category.create({ 'name' => 'Clothes' })
      test_category.name.should eq 'Clothes'
    end
  end
  describe '==' do
    it 'it is the same category if it has the same name' do
      test_category = Category.new({ 'name' => 'Dining' })
      test_category.save
      Category.all.should eq [test_category]
    end
  end
end
