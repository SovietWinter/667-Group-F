class Post < ActiveRecord::Base
	belongs_to :user

	has_many :their_read_progresses, class_name: "ReadProgress"
	has_many :read_progresses, through: :their_read_progresses

	has_many :bookmarkings
	has_many :bookmarkeds, through: :bookmarkings

	has_many :referencings
	has_many :references, through: :referencings
	has_many :backwards_referencings, class_name: "Referencing", foreign_key: "reference_id"
	has_many :referenced_by, through: :backwards_referencings, source: :post
	

	validates_presence_of :title
	validates_presence_of :content
	validates_presence_of :topic
end
