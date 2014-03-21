class Expense

  attr_reader :description, :amount, :date, :id

  def ==(another_entry)
    self.id == another_entry.id && self.description == another_entry.description && self.date == another_entry.date && self.amount == another_entry.amount
  end

  def initialize(attributes)
    @description = attributes[:description]
    @amount = attributes[:amount]
    @date = attributes[:date]
    @id = attributes[:id]
  end

  def self.all
    results = DB.exec("SELECT * FROM expenses;")
    expenses = []
    results.each do |result|
      description = result['description']
      amount = result['amount']
      date = result['date']
      id = result['id'].to_i
      expenses << Expense.new({:description => description, :amount => amount, :date => date, :id => id})
    end
    expenses
  end

  def self.create(description, amount, date)
    new_expense = Expense.new({:description => description, :amount => amount, :date => date})
    new_expense.save
    new_expense
  end

  def save
    results = DB.exec("INSERT INTO expenses (description, amount, date) VALUES ('#{@description}', '#{@amount}', '#{@date}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    results = DB.exec("DELETE FROM expenses where id = '#{@id}';")
  end

end
