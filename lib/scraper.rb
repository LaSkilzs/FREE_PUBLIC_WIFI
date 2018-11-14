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
        Location.create(
          name: loc["name"],
          wifi_status: loc["wifi_status"],
          nta_name: loc["nta_name"],
          address: loc["address"],
          zip: Zip.find_by(name: loc["zip"]),
          boro: Boro.find_by(name: loc["boro"])
          )
    end
  end




end



#Scraper.open_file
# Scraper.populate_db
