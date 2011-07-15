class Recipe < ActiveRecord::Base
  #attr_accessible :name, :description, :instructions
  has_many :steps, :dependent => :destroy
  has_many :stepingreds, :through => :steps
  has_many :ingredients, :through => :stepingreds
  validates_presence_of :name, :description
  attr_writer :step_instructions, :ingredient_names
  after_save :assign_steps, :assign_ingredients

  def step_instructions
    @step_instruction || steps.map(&:instruction).join("\n")
  end

  def ingredient_names
    @ingredient_name || ingredients.map(&:name).join("\n")
  end

private

def assign_steps
    if @step_instructions
      self.steps = @step_instructions.split(/\n+/).map do |instruction|
        Step.find_or_create_by_instruction(instruction)
      end
    end
end

  def assign_ingredients
    if @ingredient_names
      self.ingredients = @ingredient_names.split(/\n+/).map do |name|
        Ingredient.find_or_create_by_name(name)
      end
    end
  end

end
