class ItemResponsesController < ApplicationController

	def create
		@item_response = ItemResponse.new(params[:item_response])
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
		@item = Item.find(params[:item_id]) #seems hacky
		
	end

end
