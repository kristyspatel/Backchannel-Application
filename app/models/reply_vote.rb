class ReplyVote < ActiveRecord::Base
  belongs_to :reply
  belongs_to :user
  # attr_accessible :title, :body
end
