class ItemResponse < ActiveRecord::Base
  attr_accessible :item_id, :message, :user_id
	
	belongs_to :item
	
	validates :message, :length => {:minimum => 1}
	
end
