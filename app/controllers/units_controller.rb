class UnitsController < InheritedResources::Base
	def index
		@units = Unit.where("name like ?", "%#{params[:q]}%")
		respond_to do |format|
			format.html
			format.json { render json: @units }
		end
	end
end
