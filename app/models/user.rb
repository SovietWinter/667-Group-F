class User < ActiveRecord::Base
	attr_accessor :remember_token

	before_save {self.email = email.downcase}
	before_save {self.username = username.downcase}
	has_many :posts
	has_many :followings
	has_many :follows, through: :followings
	has_many :backwards_followings, class_name: "Following", foreign_key: "follow_id"
	has_many :followers, through: :backwards_followings, source: :user

	has_many :my_read_progresses, class_name: "ReadProgress"
	has_many :read_progresses, through: :my_read_progresses

	has_many :bookmarkings
	has_many :bookmarks, through: :bookmarkings

  has_attached_file :prof_pic, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates_attachment_content_type :prof_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	validates :username,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,  presence: true, length: { maximum: 255 },
		format: { with: VALID_EMAIL_REGEX } ,
		uniqueness: { case_sensitive: false }
	validates_presence_of :real_name
	validates_presence_of :blog_name
	validates_presence_of :city
	validates_presence_of :country
	has_secure_password
	validates :password, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
