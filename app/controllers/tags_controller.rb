class TagsController < InheritedResources::Base
  optional_belongs_to :recipe
end
