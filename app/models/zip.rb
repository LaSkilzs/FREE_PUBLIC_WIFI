class Zip < ActiveRecord::Base
  belongs_to :boro
  has_many :locations

end
