class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :location



end
