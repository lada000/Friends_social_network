class CreateJoinTableUserCategory < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :categories do |t|
      t.index :user_id
      t.index :category_id
    end
  end
end
