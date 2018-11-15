require_relative '../config/environment'
arter = Artii::Base.new :font => 'slant'


arter.asciify("Free Public Wifi Locater")

puts "Welcome to the Free Public Wifi Locater app,
      where you can find the closet FREE public wifi location
      near you!!!"

User.start
