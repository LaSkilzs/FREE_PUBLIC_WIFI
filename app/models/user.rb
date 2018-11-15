class User < ActiveRecord::Base

  attr_accessor :faves
    def initialize
      @faves = []
    end

  def self.start
    puts "Enter your username:"
    name = gets.chomp
    self.find_or_create_by(username: name).display_choices
  end

  def self.end
    puts "Thank you for using the Free Wifi Locater, come back soon!"
    exit()
  end

  def display_choices
    puts "Hi #{self.username}, please enter choice:"
    puts "1. Show favorites"
    puts "2. Enter location"
    puts "3. Go Back"
    puts "4. Quit"
    puts ""
      choice = gets.chomp


    case choice
    when "1"
        self.show_fav
      when "2"
        self.search_location
      when "3"
        User.start
      when "4"
        User.end
      else
        puts "Invalid choice! Please try again!"
        self.display_choices
     end

  end

  def show_fav
    if @faves == nil
      puts "You don't have any favorites yet! Try adding some!"
      puts ""
      self.display_choices
    else
    puts @faves
  end
  end

  def add_fav(location)
    binding.pry
    @faves << location
  end


  def search_location
    puts ""
    puts "Choose search method:"
    puts "1. Enter street"
    puts "2. Enter zip"
    puts "3. Enter boro"
    puts "4. Go Back"
    puts "5. Quit"
    puts "Enter choice:"
      search = gets.chomp


    case search.to_i
      when 1
        puts "Enter street"
        street = gets.chomp
        Location.retrieve_data("address", street,self)
      when 2
        puts "Enter zip"
        zip = gets.chomp
        Location.retrieve_data("zip", zip, self)

      when 3
        puts "Choose boro:"
        puts ""
        puts "1. Manhattan/NYC"
        puts "2. Brooklyn"
        puts "3. Queens"
        puts "4. Bronx"
        puts "5. Staten Island"
        puts "Enter choice:"
          choice = gets.chomp
        case choice
          when "1"
            boro = "Manhattan"
          when "2"
            boro = "Brooklyn"
          when "3"
            boro = 'Queens'
          when "4"
            boro = "Bronx"
          when "5"
            boro = "Staten Island"
          end
        Location.retrieve_data("boro", boro, self)
      when 4
        self.display_choices
      when 5
        User.end
      else
        puts "Invalid choice! Please try again!"
        self.search_location
      end
  end

end
