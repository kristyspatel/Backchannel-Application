class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :post_desc
      t.belongs_to :user
      t.datetime :post_date
      t.string :tag
      t.belongs_to :category

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :category_id
  end
end
