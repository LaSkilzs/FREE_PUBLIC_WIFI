require 'bundler/setup'
Bundler.require
require 'rake'
require 'active_record'


require_relative '../app/models/user.rb'
require_relative '../app/models/user_location.rb'
require_relative '../app/models/public_location.rb'
