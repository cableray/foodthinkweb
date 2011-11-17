class RecipeTags < ActiveRecord::Migration
  def up
  end

  def down
  end
  
  def change
    create_table :recipe_tags, :id => false do |t|
      t.integer :recipe_id
      t.integer :tag_id
    end
  end
end
