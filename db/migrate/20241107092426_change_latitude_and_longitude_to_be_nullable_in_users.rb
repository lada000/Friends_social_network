class ChangeLatitudeAndLongitudeToBeNullableInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :latitude, true
    change_column_null :users, :longitude, true
  end
end
