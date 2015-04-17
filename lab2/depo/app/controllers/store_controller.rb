class StoreController < ApplicationController
  
  def increment_count
	#session[:counter] = nil
	session[:counter] ||= 0
	session[:counter] += 1
	

	
	end
	
  def index
	@products = Product.order(:title)
	@cart = current_cart
	increment_count()

  end
  
end
