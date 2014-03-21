class Expenses
  attr_reader :description, :amount, :date, :category_id

  def initialize(attributes)
    @description = attributes[:description]
    @amount = attributes[:amount]
    @date = attributes[:date]
    @category_id = attributes[:category_id]
  end

  def self.all
    expenses_array = []
    results = DB.exec("SELECT * FROM expenses;")
    results.each do |result|
      description = result['description']
      amount = result['amount'].to_f
      date = result['date']
      category_id = result['category_id'].to_i
      expenses_array << Expenses.new(:description => description, :amount => amount, :date => date, :category_id => category_id)
    end
    expenses_array
  end

  def save
    results = DB.exec("INSERT INTO expenses(description, amount, date, category_id) VALUES ('#{@description}', #{@amount}, '#{@date}', #{@category_id});")
    #@id = results.first['id'].to_i
  end

  def ==(another)
    self.description == another.description && self.amount == another.amount && self.date == another.date && self.category_id == another.category_id
  end

end
