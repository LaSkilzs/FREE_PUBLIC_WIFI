class Location < ActiveRecord::Base

  belongs_to :zip
  belongs_to :boro

  # Location Methods

  def self.display_method(x=0,y=4,result,user)

    if result == []
      puts "Sorry nothing matches your search. Please try again."
      puts ""
      user.display_choices
    elsif result[x] == nil
      puts "Sorry, no more results!"
      puts ""
      user.display_choices
    elsif x == 0
      puts "Top 5 search results: "
    else
      puts "Here are the next 5 results:"
    end

    result[x..y].each_with_index {|r,ind| p "#{ind + x+1}. " +  r.address + ", " + r.boro.name + ", " + r.zip.name}
    binding.pry
    valid = false
    while !valid do
      prompt = TTY::Prompt.new
      options = %w(Add_to_favorites See_more_results New_search Quit)
      input = prompt.enum_select("Please enter choice:", options)

      case input
      when "Add_to_favorites"

        options = %w(1 2 3 4 5 Go_back Quit)
        add = prompt.enum_select("Please enter number of location to add to favorites:", options)
          if result[add.to_i-1] != nil
            user.add_fav(result[add.to_i-1])
          else
            puts "Invalid entry please try again."
          end
          valid = false
      when "See_more_results"
          valid = true
          self.see_more(x+5,y+5,result,user)
      when  "New_search"
          valid = true
          user.display_choices
      when "Quit"
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
