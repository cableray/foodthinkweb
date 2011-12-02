class Recipe < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :inverse_of=>:created_recipes
  has_many :supplies, :dependent => :destroy
  has_many :ingredients, :through => :supplies
  #has_many :units, :through => :supplies
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :clippers, :class_name => "User"

  scope :recent, order('created_at desc')
  scope :by_user, lambda{|user| where(:creator_id=>user.id)}
  
  accepts_nested_attributes_for :supplies, :allow_destroy => true, :reject_if=>:reject_supply?
  def reject_supply?(attributed)
    attributed['name'].blank? and attributed['ingredient_id'].blank?
  end
  
  validates :name, :presence=>true 
  validates :cook_time, :prep_time, :numericality => { :only_integer => true }
  
  searchable do
    text :name, :boost=>10
    text :description, :boost=>2
    text :steps
    text :ingredients, :boost=>5 do
      ingredients.map(&:name)
    end
    text :tags do
      tags.map(&:name)
    end
  end
  
  scope :search
  def self.search(text)
    s=Recipe.solr_search_ids do
      keywords text
    end
    Recipe.where(:id=>s) #this returns an ActiveRecord::Relation instead of a vanilla array, which is expected by has_scope.
  end
  
  attr_writer :tag_names
  after_save :assign_tags

  def tag_names
    @tag_names || tags.map(&:name).join(', ')
  end

  private

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/,\s*/).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end

  def total_time
    self.cook_time+self.prep_time
  end
  
  def ingredients_box
    #TODO: show existing ingredients.    
  end 

  def ingredients_box=(text)
    #TODO: parse ingredients.
  end  
end
