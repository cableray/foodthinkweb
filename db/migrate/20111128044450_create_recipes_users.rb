class CreateRecipesUsers < ActiveRecord::Migration
  def change
    create_table :recipes_users, :id => false do |t|
      t.integer :recipe_id
      t.integer :user_id
    end
  end

end
