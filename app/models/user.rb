class User < ActiveRecord::Base

has_many :favorites

  # USER METHODS:
  #   .start
  #   .end
  #   display_choices
  #   show_fav
  #   add_fav
  #   search_location

  #Starts the app by asking for a username
  def self.start
    prompt = TTY::Prompt.new
    name = prompt.ask("Enter your username:")
    self.find_or_create_by(username: name).display_choices
  end

  #Ends the app by thanking user and exiting
  def self.end
    puts ""
    puts "Thank you for using the Free Wifi Locater, come back soon!"
    puts ""
    exit()
  end

  #Displays the menu choices with validation
  def display_choices
    puts ""
    prompt = TTY::Prompt.new
    options = %w(Show_favorites Enter_location Go_back Quit)
    choice = prompt.select("Hi #{self.username}, please enter choice:", options)

    case choice
    when "Show_favorites"
        self.show_fav
      when "Enter_location"
        self.search_location
      when "Go_back"
        User.start
      when "Quit"
        User.end
      else
        puts "Invalid choice! Please try again!"
        self.display_choices
    end
  end

  #Shows favorite locations if there are any. It then returns to the main menu
  def show_fav
    if Favorite.select{|t| t.user_id == self.id} == []
      puts "You don't have any favorites yet! Try adding some!"
      puts ""
      self.display_choices
    else
    puts ""
    puts "FAVORITES:"
    puts Favorite.select{|t| t.user_id == self.id}.map{|t| t.location.address + ", " + t.location.boro.name + ", " + t.location.zip.name}.uniq
    puts ""
    self.display_choices
    end
  end

  #Adds a location to that users favorites list then returns to the main menu
  def add_fav(loc)
    Favorite.create!(user: self,location: loc)
    puts ""
    self.display_choices
  end

  #Allows user to enter street, zip or boro and get back results based on that info
  #with options to either add to favorites, show favorites, new search or quit
  def search_location
    prompt = TTY::Prompt.new
    options = %w(Enter_street Enter_zip Enter_boro Go_back Quit)
    search = prompt.select("Choose search method:", options)

    case search
    when "Enter_street"
        street = prompt.ask("Enter street")
        Location.retrieve_data("address", street, self)
      when "Enter_zip"
        zip = prompt.ask("Enter zip")
        Location.retrieve_data("zip", zip, self)
      when "Enter_boro"
        options = %w(Manhattan/NYC Brooklyn Queens Bronx Staten_Island)
        choice = prompt.select("Choose boro:", options)

        case choice
        when "Manhattan/NYC"
            boro = "Manhattan"
          when "Brooklyn"
            boro = "Brooklyn"
          when "Queens"
            boro = 'Queens'
          when "Bronx"
            boro = "Bronx"
          when "Staten_Island"
            boro = "Staten Island"
          end
        Location.retrieve_data("boro", boro, self)
      when "Go_back"
        self.display_choices
      when "Quit"
        User.end
      else
        puts "Invalid choice! Please try again!"
        self.search_location
    end
  end

end
