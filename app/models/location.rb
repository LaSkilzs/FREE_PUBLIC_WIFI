class Location < ActiveRecord::Base
  belongs_to :zip
  belongs_to :boro

end
