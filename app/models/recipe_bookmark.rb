class RecipeBookmark < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  validates_uniqueness_of :recipe_id, :scope=>:user_id, :message=>"Recipe has already been saved."
end
