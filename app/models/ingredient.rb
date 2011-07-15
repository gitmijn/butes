class Ingredient < ActiveRecord::Base
  has_many :stepingreds
  has_many :steps, :through => :stepingred
end
