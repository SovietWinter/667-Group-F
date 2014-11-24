class User < ActiveRecord::Base
	has_many :posts

	has_many :followings
	has_many :follows, through: :followings
	has_many :backwards_followings, class_name: "Following", foreign_key: "follow_id"
	has_many :followers, through: :backwards_followings, source: :user
	
	
	
	validates_presence_of :username
	validates_presence_of :email
	validates_presence_of :real_name
	validates_presence_of :blog_name
	validates_presence_of :city
	validates_presence_of :country
end
