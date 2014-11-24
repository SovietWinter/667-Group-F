class Responding < ActiveRecord::Base
	belongs_to :post
	belongs_to :responds_to, class_name: "Post"
end
