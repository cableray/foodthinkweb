class CreateRecipeBookmarks < ActiveRecord::Migration
  def change
    create_table :recipe_bookmarks do |t|
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
