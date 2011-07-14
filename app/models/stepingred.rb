class Stepingred < ActiveRecord::Base
  attr_accessible :amount
  belongs_to :ingredient
  belongs_to :step
end
