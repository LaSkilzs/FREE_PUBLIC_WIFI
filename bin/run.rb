require_relative '../config/environment'
arter = Artii::Base.new :font => 'slant'
require 'lolize'
require "audio-playback"
colorizer = Lolize::Colorizer.new

#Optional options for music
# options = {
#   :channels => [0,1],
#   :latency => 0,
#   :output_device => @output
# }
system("clear")
AudioPlayback.play("./lib/New York New York (online-audio-converter.com).wav")

colorizer.write arter.asciify("Free Public Wifi Locater")

puts ""
#puts arter.asciify("Free Public Wifi Locater")

puts "Welcome to the Free Public Wifi Locater app,
      where you can find the closest FREE public wifi location
      near you!!!"

#Starts the app!
User.start
