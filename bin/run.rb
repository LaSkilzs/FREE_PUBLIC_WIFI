require_relative '../config/environment'
arter = Artii::Base.new :font => 'slant'


puts arter.asciify("Free Public Wifi Locater")

puts "Welcome to the Free Public Wifi Locater app,
      where you can find the closest FREE public wifi location
      near you!!!"

User.start
