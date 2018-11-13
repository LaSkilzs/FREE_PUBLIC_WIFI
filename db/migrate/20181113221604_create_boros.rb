class CreateBoros < ActiveRecord::Migration[5.2]
  def change
    create_table :boros do |t|
      t.string :name 
    end
  end
end
