class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :status
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
