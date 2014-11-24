class Referencing < ActiveRecord::Base
	belongs_to :post
	belongs_to :reference, class_name: "Post"
end
