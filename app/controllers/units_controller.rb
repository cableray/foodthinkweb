class UnitsController < InheritedResources::Base
	def index
		@units = Unit.where("name like ?", "%#{params[:q]}%")
		@ingredients = Ingredient.where("name like ?", "%#{params[:q]}%") 
		respond_to do |format|
			format.html
			format.json { render json: @units + @ingredients }
		end
	end
end
