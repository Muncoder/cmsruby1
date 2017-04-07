class CategoriesController < ContentController

	def index
	end
	
	def show
		@category = Category.includes(:pages).find params[:id]
	end

end