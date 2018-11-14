class ChangeNullVals < ActiveRecord::Migration[5.2]
  def change
    change_column_null(
      :locations,
      :census_tract,
      from: nil,
      to: 0
    )
  end
end
