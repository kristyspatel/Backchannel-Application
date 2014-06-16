class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :reply
      t.belongs_to :post
      t.belongs_to :user

      t.timestamps
    end
    add_index :replies, :post_id
    add_index :replies, :user_id
  end
end
