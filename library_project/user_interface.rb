require './lib/authors'
require './lib/books'
require './lib/catalog'
require './lib/checkouts'
require './lib/patrons'

def main_menu
  header
  puts "Press '1' if you are a librarian."
  puts "Press '2' if you are a patron."
  puts "Press '3' if you want to exit."
  answer = gets.chomp.to_i

  if answer == 1
    librarian_menu
  elsif answer == 2
    patron_menu
  elsif answer == 3
    exit
  else
    invalid
    main_menu
  end
end

def librarian_menu
  header
  puts "Press '1' to edit catalog."
  puts "Press '2' to search catalog."
  puts "Press '3' if you want to exit."
  answer = gets.chomp.to_i

  if answer == 1
    catalog_menu
  elsif answer == 2
    search_catalog
  elsif answer == 3
    exit
  else
    invalid
    librarian_menu
  end
end

def catalog_menu

end

def search_catalog
  header
  puts "Press '1' to search by book name."
  puts "Press '2' to search by authors."
  puts "Press '3' to exit."
  answer = gets.chomp.to_i

  if answer == 1
  elsif answer == 2
  elsif answer == 3
  else
    exit
  end

end

def patron_menu
  # puts "Press '1' to edit catalog."
  # puts "Press '2' to search catalog."
  # answer = gets.chomp.to_i

  # if answer == 1
  # elsif answer == 2
  # else
  #   invalid
  #   librarian_menu
  # end
end

def header
  system 'clear'
  puts "===LIBRARY PROJECT==="
  puts "\n"
end

def invalid
  puts "Please input a valid option."
  sleep(0.7)
  system 'clear'
end

main_menu
