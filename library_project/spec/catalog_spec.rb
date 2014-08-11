require 'spec_helper'

describe :Catalog do

  describe :initalize do
  end

  describe :add do
    it "will add a new title and a new author to the database" do
      create_var
      Catalog.add_to_database("Harry Potter", "JK Rowling")
      expect(Author.all.length).to eq 3
    end

    it "will not add an exisiting author to the author database" do
      create_var
      Catalog.add_to_database("Harry Potter", "Neil Strauss")
      expect(Author.all.length).to eq 2
    end

    it "will add multiple new authors to the database" do
      create_var
      Catalog.add_to_database("The ABC Book", "Person1", "Person2")
      expect(Author.all.length).to eq 4
    end

    it "will add a new book" do
      create_var
      Catalog.add_to_database("The ABC Book", "Person1", "Person2")
      expect(Book.all.length).to eq 3
    end

    it "will add a new catalog for each author for a single book" do
      create_var
      Catalog.add_to_database("The ABC Book", "Person1", "Person2")
      expect(Catalog.all.length).to eq 2
    end
  end

  describe :search_by_title do
    it "will search for all the books with the same title" do
      create_var
      Catalog.add_to_database("The Game", "Neil Strauss", "Blah")
      result = Catalog.search_by_title("The Game")
      expect(result[0]).to eq ("Neil Strauss")
      expect(result[1]).to eq("Blah")
    end
  end

  describe :search_by_author do
    it "will search for all the books with the same title" do
      create_var
      Catalog.add_to_database("The Game", "Neil Strauss", "Blah")
      Catalog.add_to_database("The Emergency", "Neil Strauss")
      result = Catalog.search_by_author("Neil Strauss")
      expect(result[0]).to eq ("The Game")
      expect(result[1]).to eq ("The Emergency")
    end
  end

end

