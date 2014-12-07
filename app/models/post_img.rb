class PostImg < ActiveRecord::Base

	has_attached_file :image
	
	belongs_to :post
end
