require 'spec_helper'

describe 'Book' do

  describe :initialize do
    it "should initialize an instance of book class" do
      expect(Book.new({'name' => "Dr.Seuss"})).to be_an_instance_of Book
    end

    it "should initialize with a name" do
      create_var
      expect(@book1.name).to eq "The Game"
    end
  end

  describe :save do
    it "should save all authors to the database" do
      create_var
      result = DB.exec('SELECT * FROM books')
      expect(result.first['name']).to eq "The Game"
    end
  end

  describe ".all" do
    it "should list no authors when the database is empty" do
      expect(Book.all).to eq []
    end

    it "should list all of the authors in the database" do
      create_var
      expect(Book.all.length).to eq 2
    end
  end

  describe "==" do
    it "should recognize two books with the same name as identical" do
      book1 = Book.new({'name' => "The Game"})
      author2 = Book.new({'name' => "The Game"})
      expect(book1).to eq author2
    end
  end
end

