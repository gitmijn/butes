class Recipe < ActiveRecord::Base
  #attr_accessible :name, :description, :instructions
  has_many :steps, :dependent => :destroy
  has_many :stepingreds, :through => :steps
  validates_presence_of :name, :description
  attr_accessor :step_instructions
  after_save :assign_steps

private

def assign_steps
    if @step_instructions
      self.steps = @step_instructions.split(/\s+/).map do |instruction|
        Step.find_or_create_by_name(instruction)
      end
    end
end
end
