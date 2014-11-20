class User < ActiveRecord::Base
	has_many :posts
	validates_presence_of :username
	validates_presence_of :email
	validates_presence_of :real_name
	validates_presence_of :blog_name
	validates_presence_of :city
	validates_presence_of :country
end
