class Ingredient < ActiveRecord::Base
  has_many :supplies
  has_many :recipes, :through => :supplies

  	def as_json(options={})
		super.merge(type: "ingredient")
	end
end
