class Stepingred < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :step
end
