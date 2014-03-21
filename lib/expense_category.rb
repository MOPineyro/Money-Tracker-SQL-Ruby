class Expense_Category
  attr_reader :expense_id, :category_id, :id

  def ==(another_entry)
    self.id == another_entry.id && self.category_id == another_entry.category_id && self.expense_id == another_entry.expense_id
  end

  def initialize(attributes)
    @category_id = attributes[:category_id]
    @expense_id = attributes[:expense_id]
    @id = attributes[:id]
  end

  def self.all
    expense_category_list = []
    results = DB.exec("SELECT * FROM expense_category;")
    results.each do |result|
      category_id = result['category_id']
      expense_id = result['expense_id']
      id = result['id'].to_i
      categories << Expense_Category.new({:category_id => category_id, :expense_id => expense_id, :id => id})
    end
    expense_category_list
  end

  def self.create(category_id,expense_id)
    new_expense_category = Expense_Category.new({:category_id => category_id, :expense_id => expense_id})
    new_expense_category.save
    new_expense_category
  end

  def save
    results = DB.exec("INSERT INTO expense_category (category_id, expense_id) VALUES ('#{@category_id}', '#{@expense_id}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    results = DB.exec("DELETE FROM expense_category where id = '#{@id}';")
  end
end
