class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.belongs_to :comment
      t.belongs_to :user

      t.timestamps
    end
    add_index :comment_votes, :comment_id
    add_index :comment_votes, :user_id
  end
end
