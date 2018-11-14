class ChangeCensusVals < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :locations,
      :census_tract,
      from: nil,
      to: 0
    )
  end
end
