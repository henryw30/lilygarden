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
			
			respond_to do |format|
			format.html #show.html.erb
			format.json {
				render json: @section_hash
			}
			end
		end
	end

	def search
		@raw_query = params[:q]
		@query = @raw_query.downcase.gsub(",", " ").split

		#Iterate through @menu_hash looking for words in @query
		@results = Array.new
		@menu_hash.each do |section|
			items_hash = section['items']
			items_hash.each do |item|
				item_name = item['name'].downcase
				if @query.any? { |word| item_name.include? word }
					@results.push(item)
				end
			end
		end
	end

end
