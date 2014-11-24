class User < ActiveRecord::Base
	has_many :posts

	has_many :followings
	has_many :follows, through: :followings
	has_many :backwards_followings, class_name: "Following", foreign_key: "follow_id"
	has_many :followers, through: :backwards_followings, source: :user
	
	has_many :my_read_progresses, class_name: "ReadProgress"
	has_many :read_progresses, through: :my_read_progresses

	has_many :bookmarkings
	has_many :bookmarks, through: :bookmarkings

	validates_presence_of :username
	validates_presence_of :email
	validates_presence_of :real_name
	validates_presence_of :blog_name
	validates_presence_of :city
	validates_presence_of :country
end
