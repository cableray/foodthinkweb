class Supply < ActiveRecord::Base
  belongs_to :ingredients
  belongs_to :recipe
end
