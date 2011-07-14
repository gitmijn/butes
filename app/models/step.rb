class Step < ActiveRecord::Base
  #attr_accessible :recipe_id, :number, :instructions
  belongs_to :recipe
  has_many :stepingreds
  has_many :ingredients, :through => :stepingred
end
