class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :comment_id
      t.integer :artwork_id
      t.integer :user_id

      t.timestamps
    end

    add_index :likes, :comment_id
    add_index :likes, :artwork_id
    add_index :likes, :user_id
  end
end
