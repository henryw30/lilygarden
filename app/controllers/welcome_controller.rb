class WelcomeController < ApplicationController

	layout 'application'

	def index
		read_menu
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

	def index2
		read_menu
		@restaurant = @json_hash['restaurant']
		@address = @json_hash['address']
		@phone = @json_hash['phone']
		@hours = @json_hash['hours']
		respond_to do |format|
			format.html {#index.html.erb
				render :index
			}
			format.json {
				render json: @menu_hash
			}
		end
	end

end
