class Book

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

  def self.all
    @books = []
    result = DB.exec("SELECT * FROM books;")
    result.each do |book|
      name = book['name']
      id = book['id'].to_i
      @books << Book.new({"name" => "#{name}","id" => "#{id}"})
    end
    @books
  end

  def save
    result = DB.exec("INSERT INTO books (name) VALUES ('#{@name}') RETURNING ID;")
    @id = result.first['id'].to_i
  end

  def self.find(name)
    Book.all.each do |book|
      if book.name == name
        @result = book
      end
    end
    @result
  end

  def self.find_by_id(id)
    Book.all.each do |book|
      if book.id == id
        @result = book.name
      end
    end
    @result
  end

  def ==(other_book)
    self.name == other_book.name && self.id == other_book.id
  end
end
