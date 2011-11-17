class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :cook_time
      t.integer :prep_time
      t.text :description
      t.text :steps

      t.timestamps
    end
  end
end
