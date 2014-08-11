require './lib/books'
require './lib/authors'

class Catalog

  attr_reader :book_id, :author_id

  def initialize(book_id,author_id)
    @book_id = book_id
    @author_id = author_id
  end

  def self.add_to_database(title, *authors)
    @name_array = []
    @authors_id = []

    author_array = Author.all
    author_array.each do |object|
      @name_array << object.name
    end

    authors.each do |author|
      if !@name_array.include?(author)
        new_author = Author.new({'name' => "#{author}"})
        new_author.save
        @authors_id << new_author.id
      else
        @authors_id << Author.find(author).id
      end
    end

    new_book = Book.new({'name' => "#{title}"})
    new_book.save

    @authors_id.each do |author_id|

      DB.exec("INSERT INTO catalog (book_id, author_id) VALUES (#{new_book.id},#{author_id})")
    end

  end

  def self.all
    @catalog = []
    result = DB.exec("SELECT * FROM catalog;")
    result.each do |catalog|
      book_id = catalog['book_id']
      author_id = catalog['author_id']
      @catalog << Catalog.new(book_id,author_id)
    end
    @catalog
  end

  def self.search_by_title(title)
    @authors = []
    book = Book.find(title)
    Catalog.all.each do |catalog|
      if catalog.book_id.to_i == book.id
        @authors << Author.find_by_id(catalog.author_id.to_i)
      end
    end
    @authors
  end

  def self.search_by_author(author)
    @titles = []

    author = Author.find(author)
    Catalog.all.each do |catalog|
      if catalog.author_id.to_i == author.id
        @titles << Book.find_by_id(catalog.book_id.to_i)
      end
    end
    @titles
  end


end


