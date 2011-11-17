class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.decimal :amount
      t.string :unit

      t.timestamps
      t.integer :ingredient_id
      t.integer :recipe_id
    end
  end
end
