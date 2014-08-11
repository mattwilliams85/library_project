require 'rspec'
require 'authors'
require 'books'
require 'catalog'
require 'checkouts'
require 'patrons'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'library_project_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("TRUNCATE TABLE authors RESTART IDENTITY;")
    DB.exec("TRUNCATE TABLE books RESTART IDENTITY;")
    DB.exec("TRUNCATE TABLE patrons RESTART IDENTITY;")
    DB.exec("TRUNCATE TABLE catalog RESTART IDENTITY;")
  end
end

def create_var
  @author1 = Author.new({'name' => "Dr.Seuss"})
  @author1.save
  @author2 = Author.new({'name' => "Neil Strauss"})
  @author2.save
  @book1 = Book.new({'name' => "The Game"})
  @book1.save
  @book2 = Book.new({'name' => "Pillars of the Earth"})
  @book2.save
  @patron1 = Patron.new({'name' => "Matt"})
  @patron1.save
  @patron2 = Patron.new({'name' => "Kat"})
  @patron2.save
end


