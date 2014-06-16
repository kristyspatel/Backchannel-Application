class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :comment_votes, :dependent => :delete_all
  attr_accessible :comment_desc
  validates :comment_desc, :presence => true

  def votes
    return CommentVote.find_all_by_comment_id(self)
  end

  def user_name
    @user = User.find(self.user)
    if @user.nil?
      return 'Anonymous'
    else
      @user.first_name +  @user.last_name
    end
  end

  def unity_id
    @user = User.find(self.user)
    if @user.nil?
      return 'Anonymous'
    else
      @user.unity_id
    end
  end

end
