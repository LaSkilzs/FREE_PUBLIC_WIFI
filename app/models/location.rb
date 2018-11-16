class Location < ActiveRecord::Base

  belongs_to :zip
  belongs_to :boro
  has_many :favorites

  # Location Methods

  def self.display_method(x=0,y=4,result,user)
    puts ""
    if result == []
      puts "Sorry nothing matches your search. Please try again."
      puts ""
      user.display_choices
    elsif result[x] == nil
      puts "Sorry, no more results!"
      puts ""
      user.display_choices
      return
    elsif x == 0
      puts "Search results: "
    else
      puts "More results:"
    end

    if result != nil
    result[x..y].each_with_index {|r,ind| p "#{ind + x+1}. " +  r.address + ", " + r.boro.name + ", " + r.zip.name}
    end
    max = result.length
    # result = most_popular[0..1] + retrieve_data[0..2]
    # retrieve_data.each {|r| puts r.address + ", " +  r.zip.name + ", " + r.boro.name}
    valid = false
    while !valid do
      prompt = TTY::Prompt.new
      options = %w(Add_to_favorites See_more_results New_search Quit)
      puts ""
      input = prompt.select("Please enter choice:", options)

      if input == "Add_to_favorites"
        choices = {result[x].address => x, result[x+1].address => x+1}

        #add = prompt.enum_select("Please enter number of location to add to favorites:", choices)
        add = prompt.select("Please choose location to add to favorites:") do |menu|
          menu.default 1
          if result[x] != nil
          menu.choice result[x].address, 1
          end
          if result[x+1] != nil
          menu.choice result[x+1].address, 2
          end
          if result[x+2] != nil
          menu.choice result[x+2].address, 3
          end
          if result[x+3] != nil
          menu.choice result[x+3].address, 4
          end
          if result[x+4] != nil
          menu.choice result[x+4].address, 5
          end

        end
        user.add_fav(result[x+(add-1)])
          # if result[add.to_i - 1] != nil
          #   user.add_fav(result[add.to_i - 1])
          # else
          #   puts "Invalid entry please try again."
          # end
           valid = true
        elsif input == "See_more_results"
          puts ""
          valid = true
          if y+5 > max
          self.see_more(x+5,max,result,user)
          else
             self.see_more(x+5,y+5,result,user)
           end
        elsif input == "New_search"
          puts ""
          valid = true
          user.display_choices
        elsif input == "Quit"
          User.end
        else
          puts "Invalid choice! Please try again!"
          valid = false
        end
    end
  end

  def self.retrieve_data(type, option, user)
    if type == "address"
      option = option.upcase
      first_result = Location.find_by(address: option)
      result = Location.select{|t| t.zip.name == first_result.zip.name}
    elsif type == "zip"
      result = Location.select{|t| t.zip.name == option}
    elsif type == "boro"
      option = option.titleize
      result = Location.select{|t| t.boro.name == option}
    end
    result
    self.most_popular(result,user)
  end

  def self.most_popular(search_list,user)
    result = search_list.sort_by{|t| t.census_tract}.reverse
    self.see_more(0,4,result,user)
  end

  def self.see_more(x,y,result,user)
      display_method(x,y,result,user)

  end


end
