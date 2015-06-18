class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def read_menu
  	file = open('public/menu.json')
  	file_as_string = file.read
  	@json_hash = JSON.parse(file_as_string)
  	@menu_hash = @json_hash['menu']
    @restaurant_name = @json_hash['restaurant']
    @address_hash = @json_hash['address']
    @phone = @json_hash['phone']
    @hours_hash = @json_hash['hours']
  end
  
end
