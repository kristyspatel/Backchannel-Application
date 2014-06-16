class User < ActiveRecord::Base
  include SecureRandom
  #has_many :posts, :dependent => destroy
  #has_many :comments, :dependent => destroy
  #has_many :comment_votes, :dependent => destroy
  #has_many :post_votes, :dependent => destroy


  attr_accessible :unity_id,:first_name, :last_name, :last_visited, :password, :session_token
  attr_protected :role
  attr_accessor :password_confirmation
  #has_secure_password

  #before_save(self. = first_name.capitalize)
  #before_save(self.)

  validates :unity_id, presence: {message: 'Unity Id cannot be blank'}
  validates :unity_id, length: {minimum: 4, message: 'Unity Id should be of minimum Length 4' }
  validates :unity_id, uniqueness: {message: 'Unity Id should be unique'}

  validates :first_name, presence: {message: 'First Name cannot be blank'}
  validates :last_name, presence: {message: 'Last Name cannot be blank'}
  validates :password, presence: {message: 'Password cannot be blank'}
  validates :password, length: {minimum: 6, message: 'Password should be of minimum Length 6'}
  validates :role, presence: {message: 'Password cannot be blank'}
  validates :password, confirmation: {message: "Passwords don't match"}
  validates :password_confirmation, presence: {message: 'Please re-enter password'}

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticate(password)
    return self.password.eql?password

  end
end
