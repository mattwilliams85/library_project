require 'spec_helper'

describe 'Author' do

  describe :initialize do
    it "should initialize an instance of author class" do
      expect(Author.new({'name' => "Dr.Seuss"})).to be_an_instance_of Author
    end

    it "should initialize with a name" do
      create_var
      expect(@author1.name).to eq "Dr.Seuss"
    end
  end

  describe :save do
    it "should save all authors to the database" do
      create_var
      result = DB.exec('SELECT * FROM authors')
      expect(result.first['name']).to eq "Dr.Seuss"
    end
  end

  describe ".all" do
    it "should list no authors when the database is empty" do
      expect(Author.all).to eq []
    end

    it "should list all of the authors in the database" do
      create_var
      expect(Author.all.length).to eq 2
    end
  end

  describe "==" do
    it "should recognize two books with the same name as identical" do
      author1 = Author.new({'name' => "Dr.Seuss"})
      author2 = Author.new({'name' => "Dr.Seuss"})
      expect(author1).to eq author2
    end
  end
end


