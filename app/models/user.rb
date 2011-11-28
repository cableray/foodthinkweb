class User < ActiveRecord::Base
	has_and_belongs_to_many :clippings, :class_name => 'Recipe'
	has_many :created_recipes, :class_name=>'Recipe', :foreign_key =>'creator_id', :inverse_of=>:creator
end
