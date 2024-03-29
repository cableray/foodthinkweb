class Recipe < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :inverse_of=>:created_recipes
  has_many :supplies, :dependent => :destroy
  has_many :ingredients, :through => :supplies
  has_and_belongs_to_many :tags
  has_many :recipe_bookmarks
  has_many :clippers, :through=>:recipe_bookmarks, :source=>:user, :class_name => "User"

  scope :recent, order('created_at desc')
  scope :by_user, lambda{|user| where(:creator_id=>user.id)}
  
  accepts_nested_attributes_for :supplies, :allow_destroy => true, :reject_if=>:reject_supply?

  #attr_accessible :ingredients_box
  #virtual_attribute :ingredients_box

  def reject_supply?(attributed)
    attributed['name'].blank? and attributed['ingredient_id'].blank?
  end
  
  def clipped_by? (user)
    clippers.exists?(id:user.id)
  end
  
  validates :name, :presence=>true 
  validates :cook_time, :prep_time, :numericality => { :only_integer => false }
  
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
  
  scope :tag
  def self.tag(name)
    Recipe.joins(:tags).where("upper(tags.name)=?",name.humanize.upcase)
  end
  
  attr_writer :tag_names
  after_save :assign_tags

  def tag_names
    @tag_names || tags.map(&:name).join(', ')
  end

  def total_time
    self.cook_time+self.prep_time
  end
  
  def remove_bookmark_for_user (user)
    clippers.delete user
  end
  

  def ingredients_box=(text)
    @ingredients_box = text
  end

  def ingredients_box
    @ingredients_box
  end
  
  def cook_time_minutes
    (cook_time || 0)/1.minute
  end
  
  def cook_time_minutes=(time)
    self.cook_time=time.to_f.minutes
  end
  
  def prep_time_minutes
    (prep_time || 0)/1.minute
  end
  
  def prep_time_minutes=(time)
    self.prep_time=time.to_f.minutes  
  end



  #private
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/,\s*/).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end

  after_save :assign_supplies
  def assign_supplies
    supply_a = []
    @ingredients_box.split('\n').each do |line_item|
      supply_a << Supply.parse_line_item(line_item)
    end
    supplies = supply_a
  end

  #attr_writer :ingredients_box


  
end
