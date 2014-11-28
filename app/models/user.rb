class User < ActiveRecord::Base
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
end
