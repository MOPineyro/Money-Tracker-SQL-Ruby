class Category

  attr_reader :name, :category_id, :categories

  def initialize(attributes)
    @name = attributes['name']
    @category_id = attributes['id']
  end

  def self.all
    @categories = []
    results = DB.exec("SELECT * FROM category")

    results.each do |result|
      @categories << Category.new(result)
    end

    @categories
  end

  def save
    result = DB.exec("INSERT INTO category (name) VALUES ('#{@name}') RETURNING id;")
    @category_id = result.first['id'].to_i
  end

  def self.create(attributes)
    new_category = Category.new(attributes)
    new_category.save
    new_category
  end

  def ==(another_category)
    self.name == another_category.name
  end
end
