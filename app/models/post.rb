class Post < ActiveRecord::Base
	belongs_to :user

	has_many :their_read_progresses, class_name: "ReadProgress"
	has_many :read_progresses, through: :their_read_progresses

	validates_presence_of :title
	validates_presence_of :content
	validates_presence_of :topic
end
