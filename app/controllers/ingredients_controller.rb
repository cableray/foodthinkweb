class IngredientsController < InheritedResources::Base
  respond_to :html, :xml, :json

  def index
  	@ingred = Ingredient.where("name like ?", "%#{params[:q]}%")
		respond_to do |format|
			format.html
			format.json { render json: @ingred }
    end
  end
end
