class Location < ActiveRecord::Base

  belongs_to :zip
  belongs_to :boro

  # Location Methods

  def self.display_method(x=0,y=4,result)
    if x == 0
    puts "Top 5 search results: "
  else
    puts "Here are the next 5 results:"
  end

    result[x..y].each {|r| p r.address + ", " + r.boro.name}

    # result = most_popular[0..1] + retrieve_data[0..2]
    # retrieve_data.each {|r| puts r.address + ", " +  r.zip.name + ", " + r.boro.name}
    puts "Want to see the next 5 results? (y/n)"
    input = gets.chomp
    if input == "y"
      self.see_more(x+5,y+5,result)
    end
  end

  def self.retrieve_data(type, option)

    if type == "address"
      option = option.upcase
      first_result = Location.find_by(address: option)
      result = Location.select{|t| t.zip == first_result.zip}
    elsif type == "zip"
      result = Location.select{|t| t.zip == option}
    elsif type == "boro"
      option = option.titleize
      result = Location.select{|t| t.boro.name == option}

    end
    result
    self.most_popular(result)

    # result.each {|r| puts r.address + ", " +  r.zip.name + ", " + r.boro.name}
    # result.limit(5).offset(0)
    #binding.pry
    #puts "You selected #{result.address}!!!!!!"

  end

  def self.most_popular(search_list)
    result = search_list.sort_by{|t| t.census_tract}.reverse
    self.see_more(0,4,result)
  end

  def self.see_more(x,y,result)

    display_method(x,y,result)

  end


end
