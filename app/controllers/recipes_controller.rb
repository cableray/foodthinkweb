class RecipesController < InheritedResources::Base
  respond_to :html, :xml, :json
  optional_belongs_to :user

  has_scope :search
  
  # GET /recipes
  # GET /recipes.json
  def index
    if params[:user_id] then
      @recipes=User.find(params[:user_id]).created_recipes
      respond_with do |format|
        format.html { @recipes=RecipeDecorator.decorate @recipes }
        format.json { render json: RecipeJsonDecorator.decorate(@recipes) }
      end
    else
      @featured ||= RecipeDecorator.decorate Recipe.recent.limit(2) unless params[:search]
      index! do |format|
        format.html { @recipes=RecipeDecorator.decorate @recipes }
        format.json { render json: RecipeJsonDecorator.decorate(@recipes) }
      end
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
  
  # PUT /recipes/1/clip[.json]
  def clip
    @recipe=Recipe.find(params[:id])
    respond_with do |format|
      begin
        current_user.clippings << @recipe
        format.html {redirect_to clippings_user_recipes_path(current_user), notice: 'Recipe was successfully added.'}
        format.json do
           render json: {
            links: [
              {rel: 'self', href: recipe_url(@recipe)},
              {rel: 'added_to', href: clippings_user_recipes_url(current_user)}
              ], 
            notice:'Recipe was successfully added.', 
            changed:true}, # TODO dry this up
           status: :ok
        end
      rescue ActiveRecord::RecordInvalid => invalid
        if invalid.record.errors[:recipe_id] then
          format.html { redirect_to clippings_user_recipes_path(current_user), notice: 'Recipe has already been clipped' }
          format.json do
             render json: {
              links: [
                {rel: 'self', href: recipe_url(@recipe)},
                {rel: 'added_to', href: clippings_user_recipes_url(current_user)}
                ], 
              notice:'Recipe has already been clipped.', 
              changed:false}, # TODO dry this up
             status: :ok
          end
        else
          raise invalid
        end
      end
    end
  end
  
  # GET /users/1/recipes/clippings[.json]
  def clippings
    @recipes = User.find(params[:user_id]).clippings
    respond_with do |format|
      format.html do
        @recipes=RecipeDecorator.decorate @recipes 
        render 'index'
      end
      format.json { render json: RecipeJsonDecorator.decorate(@recipes) }
    end
  end


end
