require_relative '../config/environment'




puts "Welcome to the Free Public Wifi Locater app,
      where you can find the closet FREE public wifi location
      near you!!!"

def self.start
  puts "Enter your username:"
  name = gets.chomp
end

def display_choices
  puts "Enter choice:"
    choice = gets.chomp
  puts "1. Show favorites"
  puts "2. Enter location"
  puts "3. Go Back"
  puts "4. Quit"

  case choice
    when 1
      user.show_fav
    when 2
      search_location
    when 3
      User.start
    when 4
      "Thank you for using the Free Wifi Locater, come back soon"
   end
end

def show_fav
  puts @faves
end

def add_fav(location)
  @faves << location
end


def search_location
  puts "Enter choice:"
    search = gets.chomp
  puts "1. Enter street"
  puts "2. Enter zip"
  puts "3. Enter boro"
  puts "4. Go Back"
  puts "5. Quit"

  case search
    when 1
      puts "Enter street"
      street = gets.chomp
    when 2
      puts "Enter zip"
      zip = gets.chomp
    when 3
      puts = "Enter boro"
      boro = gets.chomp
    when 4
      display_choices
    when 5
      "Thanks for using the Free Wifi Locater"
    end
end

# Location Methods

def display_method
  result = most_popular[0..1] + retrieve_data[0..2]
end

def retrieve_data
  limit 5
end

def most_popular
  limit 2
end

def see_more
  retrieve_data
  most_popular

end

puts "Hello World"
