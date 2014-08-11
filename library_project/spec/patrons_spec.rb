require 'spec_helper'

describe 'Patron' do

  describe :initialize do
    it "should initialize an instance of patron class" do
      expect(Patron.new({'name' => "Matt"})).to be_an_instance_of Patron
    end

    it "should initialize with a name" do
      create_var
      expect(@patron1.name).to eq "Matt"
    end
  end

  describe :save do
    it "should save all patrons to the database" do
      create_var
      result = DB.exec('SELECT * FROM patrons')
      expect(result.first['name']).to eq "Matt"
    end
  end

  describe ".all" do
    it "should list no patrons when the database is empty" do
      expect(Patron.all).to eq []
    end

    it "should list all of the patrons in the database" do
      create_var
      expect(Patron.all.length).to eq 2
    end
  end

  describe "==" do
    it "should recognize two books with the same name as identical" do
      patron1 = Patron.new({'name' => "Matt"})
      patron2 = Patron.new({'name' => "Matt"})
      expect(patron1).to eq patron2
    end
  end

  describe "delete" do
    it 'should remove selected patron from the database' do
      create_var
      Patron.find('Matt').delete
      expect(Patron.all.length).to eq 1
    end
  end
end


