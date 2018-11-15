class RemoveFaveCol < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :faves, :string
  end
end
