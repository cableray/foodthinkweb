class RecipesController < InheritedResources::Base
  respond_to :html, :xml, :json

  has_scope :search
  
  # GET /recipes
  # GET /recipes.json
  def index
    index! do |format|
      format.html { @recipes=RecipeDecorator.decorate @recipes }
      format.json { render json: RecipeJsonDecorator.decorate(@recipes) }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    show! do |format|
      format.html { @recipe = RecipeDecorator.decorate(@recipe) }
      format.json { render json: RecipeJsonDecorator.decorate(@recipe) }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
  #  @recipe = Recipe.new
  #
    new! do |format|
      # format.html # new.html.erb
      # format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
  #  @recipe = Recipe.find(params[:id])
    edit!
  end

  # POST /recipes
  # POST /recipes.json
  def create
  #  @recipe = Recipe.new(params[:recipe])
  #
    create! do |success, failure|
  #    if @recipe.save # Not needed!
  #      success.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
  #      success.json { render json: @recipe, status: :created, location: @recipe }
  #    else
  #      failure.html { render action: "new" }
  #      failure.json { render json: @recipe.errors, status: :unprocessable_entity }
  #    end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
  #  @recipe = Recipe.find(params[:id])
  #
    update! do |success, failure|
  #    success.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
  #    success.json { head :ok }
  #    failure.html { render action: "edit" }
  #    failure.json { render json: @recipe.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
  #  @recipe = Recipe.find(params[:id])
  #  @recipe.destroy
  #
    destroy! do |format|
  #    format.html { redirect_to recipes_url }
  #    format.json { head :ok }
    end
  end

  def home
    @featured ||= Recipe.recent.limit(2)
      index! do |format|
        format.html { @recipes=RecipeDecorator.decorate @recipes }
        format.json { render json: RecipeJsonDecorator.decorate(@recipes) }
    end
  end
end
