class Step < ActiveRecord::Base
  #attr_accessible :recipe_id, :number, :instructions
  belongs_to :recipe
  has_many :stepingreds
  has_many :ingredients, :through => :stepingreds
  attr_writer :ingred_names
  after_save :assign_ingredients

  def ingred_names
    @ingred_name || ingredients.map(&:name).join("\n")
  end

    def assign_ingredients
    if @ingred_names
      self.ingredients = @ingred_names.split(/\n+/).map do |name|
        Ingredient.find_or_create_by_name(name)
      end
    end
  end

end
