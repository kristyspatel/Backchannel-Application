class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, :dependent => :delete_all
  has_many :post_votes,:dependent => :delete_all
  attr_accessible :post_date, :post_desc, :tag, :weight, :title
  validates :post_desc, :presence => true
  validates :category, :presence => true
  validates :title, :presence => true

  def votes
    return PostVote.find_all_by_post_id(self)
  end
  def comments
    return Comment.find_all_by_post_id(self)
  end

  def user_name
    User.find(self.user).first_name +  User.find(self.user).last_name
  end

  def unity_id
    User.find(self.user).unity_id
  end

end
