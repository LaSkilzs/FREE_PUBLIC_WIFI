class LocationsAddColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :name, :string
    add_column :locations, :wifi_status, :boolean
    add_column :locations, :nta_name, :string
    add_column :locations, :address, :string
    add_column :locations, :boro_id, :integer
    add_column :locations, :zip_id, :integer
  end
end
