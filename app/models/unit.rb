class Unit < ActiveRecord::Base
	has_many :supplies

	def index
		@units = Unit.all
		respond_to do |format|
			format.html
			format.json { render json: @units }
		end
	end
end
