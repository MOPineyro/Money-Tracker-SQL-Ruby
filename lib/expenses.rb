class Expense
  attr_reader :description, :amount, :date, :id

  def initialize(attributes)
    @description = attributes[:description]
    @amount = attributes[:amount]
    @date = attributes[:date]
  end

  def self.all
    expenses_array = []
    results = DB.exec("SELECT * FROM expenses;")
    results.each do |result|
      description = result['description']
      amount = result['amount'].to_f
      date = result['date']
      expenses_array << Expense.new(:description => description, :amount => amount, :date => date)
    end
    expenses_array
  end

  def save
    results = DB.exec("INSERT INTO expenses(description, amount, date) VALUES ('#{@description}', #{@amount}, '#{@date}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another)
    self.description == another.description && self.amount == another.amount && self.date == another.date
  end

  def self.create (attributes)
    expense = Expense.new(attributes)
    expense.save
    expense
  end

end
