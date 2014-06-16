class CreateReplyVotes < ActiveRecord::Migration
  def change
    create_table :reply_votes do |t|
      t.belongs_to :reply
      t.belongs_to :user

      t.timestamps
    end
    add_index :reply_votes, :reply_id
    add_index :reply_votes, :user_id
  end
end
