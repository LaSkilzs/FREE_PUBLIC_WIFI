require 'bundler'
Bundler.require



# connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/wifi_locations.db')
ActiveRecord::Base.logger = nil


require_all 'app'
