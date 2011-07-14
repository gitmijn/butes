class Ingredient < ActiveRecord::Base
  attr_accessible :name
  has_many :stepingreds
  has_many :steps, :through => :stepingred
end
