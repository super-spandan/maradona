class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price, :owner_id
	
	belongs_to :user, :foreign_key => :owner_id
	has_many :item_responses

	validates :name, :presence => true 
	validates :price, :presence => true
	validates :description, :presence => true
	validates :owner_id, :presence => true
	

end
