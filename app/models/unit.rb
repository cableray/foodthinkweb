class Unit < ActiveRecord::Base
	has_many :supplies

	def as_json(options={})
		super.merge(type: "unit")
	end
end
