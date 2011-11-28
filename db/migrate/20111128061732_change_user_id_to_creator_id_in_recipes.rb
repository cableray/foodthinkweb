class ChangeUserIdToCreatorIdInRecipes < ActiveRecord::Migration
  def change
    rename_column :recipes, :user_id, :creator_id
  end
end
