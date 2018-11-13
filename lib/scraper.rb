require "json"
require "pry"
require "open-uri"

class Scraper

  def self.open_file
    jfile = open ("https://data.cityofnewyork.us/resource/24un-wiy8.json?$limit=2000")

    file = File.read(jfile)
    hash = JSON.parse(file)
    binding.pry
  end
end

Scraper.open_file
