class MenuController < ApplicationController

	layout 'application'

	before_action :read_menu

	def index
		@restaurant = @json_hash['restaurant']
		@address = @json_hash['address']
		@phone = @json_hash['phone']
		@hours = @json_hash['hours']
		respond_to do |format|
			format.html #index.html.erb
			format.json {
				render json: @menu_hash
			}
		end
	end

	def show
		index = params[:id].to_i
		if index > @menu_hash.size
			redirect_to(:action => 'index')
		else
			@section_hash = @menu_hash[index]
			@header = @section_hash['header']
			@items_hash = @section_hash['items']

			#Determine number of sizes
			item = @items_hash[0]
			@num_sizes = item['price'].size
		end
	end

end
