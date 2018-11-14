require "./config/environment"
require "json"
require "pry"
require "open-uri"

class Scraper

  def self.open_file
    jfile = open ("https://data.cityofnewyork.us/resource/24un-wiy8.json?$limit=2000")

    file = File.read(jfile)
    hash = JSON.parse(file)
    #binding.pry
  end

  def self.populate_db

    #Add all unique zipcodes
    self.open_file.each do |loc|
      if !Zip.all.collect{|t| t.name}.include?(loc["zip"])
        Zip.create(name: loc["zip"])
      end
    end

    #Add all boros
    Boro.create(name: "Staten Island")
    Boro.create(name: "Manhattan")
    Boro.create(name: "Brooklyn")
    Boro.create(name: "Bronx")
    Boro.create(name: "Queens")

    #Create all instances of location class
    self.open_file.each do |loc|
        l = Location.create(
          name: loc["name"],
          wifi_status: loc["wifi_status"],
          nta_name: loc["nta_name"],
          address: loc["address"],
          zip: Zip.find_by(name: loc["zip"]),
          boro: Boro.find_by(name: loc["boro"]),
          census_tract: loc["census_tract"].to_i
          )

    end
  end

  def self.get_rid_of_nil


    res = Location.select{|t| t.census_tract == nil}

    res.each do |t|
      t.census_tract = 0
      t.save
    end

  end

  def self.change_to_int
    Location.all.each do |t|
      t.update_at census_tract.to_i
    end
  end


Scraper.populate_db
Scraper.get_rid_of_nil
end


#Scraper.get_rid_of_nil
#Scraper.open_file
# Scraper.populate_db
