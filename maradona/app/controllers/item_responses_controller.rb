class ItemResponsesController < ApplicationController

	def create
		@item_response = ItemResponse.new(params[:item_response])
		#@item_response = ItemResponse.new
=begin				
		respond_to do |format|
      if @item_response.save
        format.js { render }
      end
    end
=end		
		@item_response.save
		redirect_to :back
	end
		
	def new 	
		#@item_response = ItemResponse.new(user_id: current_user.id, item_id: params[:item_id]) 		
		@item_response = ItemResponse.new
	end

end
