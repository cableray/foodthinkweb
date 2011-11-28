class User < ActiveRecord::Base
	has_and_belongs_to_many :clippings, :class_name => 'Recipe'
	has_many :recipes
end
