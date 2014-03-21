class Categories

  attr_reader :name, :id

  def ==(another_entry)
    self.id == another_entry.id && self.name == another_entry.name
  end

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.all
    categories = []
    results = DB.exec("SELECT * FROM categories;")
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      categories << Categories.new({:name => name, :id => id})
    end
    categories
  end

  def self.create(name)
    new_category = Categories.new({:name => name})
    new_category.save
    new_category
  end

  def save
    results = DB.exec("INSERT INTO categories (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    results = DB.exec("DELETE FROM categories where id = '#{@id}';")
  end

end
