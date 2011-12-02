class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :email, :password

  validates :username, presence: true, 
                       #length: 5,
                       #format: regexp, on: :create,
                       uniqueness: true

  validates :email, presence: true, 
                       #length: 5,
                       #format: regexp, on: :create,
                       uniqueness: true

  validates :password,  presence: true, 
                       #length: 5,
                       confirmation: true
                       #format: regexp, on: :create,

	has_many :recipe_bookmarks
	has_many :clippings, :through=>:recipe_bookmarks, :source=>:recipe, :class_name => 'Recipe'
	has_many :created_recipes, :class_name=>'Recipe', :foreign_key =>'creator_id', :inverse_of=>:creator

  
end
