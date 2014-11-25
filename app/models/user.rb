class User < ActiveRecord::Base
	before_save { self.email = email.downcase, self.username = username.downcase}
	has_many :posts
	validates :username,  presence: true, length: { maximum: 50 },
	    uniqueness: { case_sensitive: false }
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
