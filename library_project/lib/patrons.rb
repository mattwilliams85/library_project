class Patron

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

  def self.all
    @patrons = []
    result = DB.exec("SELECT * FROM patrons;")
    result.each do |patron|
      name = patron['name']
      id = patron['id'].to_i
      @patrons << Patron.new({"name" => "#{name}","id" => "#{id}"})
    end
    @patrons
  end

  def save
    result = DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}') RETURNING ID;")
    @id = result.first['id'].to_i
  end

  def self.find(name)
    Patron.all.each do |patron|
      if patron.name == name
        @result = patron
      end
    end
    @result
  end

  def delete
    DB.exec("DELETE FROM patrons WHERE name = '#{@name}'")
  end

  def ==(other_patron)
    self.name == other_patron.name && self.id == other_patron.id
  end
end
