class PeerRequest < ActiveRecord::Base
  attr_accessible :user_id, :replied, :to
	
	belongs_to :user
	
	#validates :check_does_not_exist
	
	after_save :create_peer_ship
	
	#Creates a peership and destroy PeerRequest object
	def create_peer_ship
		if self.replied == true
			user_id = self.user_id
			user2_id = self.to			
			Peership.create(:user_id => user_id, :user2_id => user2_id) unless Peership.exists?(user_id, user2_id) 			
		end
		#Delete request object unless user did not make a selection 
		PeerRequest.destroy(self.id) unless self.replied == nil 		
	end
	
	def self.request_exists(user1_id, user2_id) 
		return "exists" if PeerRequest.find_by_user_id_and_to(user1_id, user2_id)
		return "inv_exists" if PeerRequest.find_by_user_id_and_to(user2_id, user1_id)
		return false
	end
	
	def check_does_not_exist
		return true if PeerRequest.request_exists(self.user_id, self.to) == false
	end
	
end
