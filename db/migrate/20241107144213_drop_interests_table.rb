class DropInterestsTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :interests, if_exists: true
  end

  def down
    create_table :interests do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
