
require 'sinatra/activerecord/rake'


desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

require_relative 'config/environment'

desc 'delete all table contents'
task :del_tbl do
  Location.delete_all
  Boro.delete_all
  Zip.delete_all
  #puts Location.count
end
