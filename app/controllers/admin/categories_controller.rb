module Admin
	class CategoriesController < ApplicationController
		
		def index
			@categories = Category.all.order("created_at DESC")
		end
		
	end
end