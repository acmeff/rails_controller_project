class AddPolymorphicLikes < ActiveRecord::Migration[5.0]
  def change

    remove_column :likes, :artwork_id
    remove_column :likes, :comment_id

    add_column :likes, :liked_id, :integer
    add_column :likes, :liked_type, :string

    add_index :likes, [:liked_id, :liked_type]
  end
end
