class AddCensusTractColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :census_tract, :string
  end
end
