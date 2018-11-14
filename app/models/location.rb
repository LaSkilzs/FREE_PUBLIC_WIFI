class Location < ActiveRecord::Base

  belongs_to :zip
  belongs_to :boro

  # Location Methods

  def display_method
    result = most_popular[0..1] + retrieve_data[0..2]
    # retrieve_data.each {|r| puts r.address + ", " +  r.zip.name + ", " + r.boro.name}
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
  
    result.sort_by{|t| t.census_tract }.reverse
    binding.pry
    # result.each {|r| puts r.address + ", " +  r.zip.name + ", " + r.boro.name}
    # result.limit(5).offset(0)
    #binding.pry
    #puts "You selected #{result.address}!!!!!!"

  end

  def most_popular
    result = retrieve_data.sort_by{|t| t.census_tract}.reverse
    binding.pry
  end

  def see_more
    retrieve_data
    most_popular

  end


end
