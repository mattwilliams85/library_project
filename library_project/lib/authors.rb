class Author

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

  def self.all
    @authors = []
    result = DB.exec("SELECT * FROM authors;")
    result.each do |author|
      name = author['name']
      id = author['id'].to_i
      @authors << Author.new({"name" => "#{name}","id" => "#{id}"})
    end
    @authors
  end

  def save
    result = DB.exec("INSERT INTO authors (name) VALUES ('#{@name}') RETURNING ID;")
    @id = result.first['id'].to_i
  end

  def self.find(name)
    Author.all.each do |author|
      if author.name == name
        @result = author
      end
    end
    @result
  end

  def ==(other_book)
    self.name == other_book.name && self.id == other_book.id
  end
end

