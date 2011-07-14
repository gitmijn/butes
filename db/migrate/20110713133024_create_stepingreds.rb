class CreateStepingreds < ActiveRecord::Migration
  def change
    create_table :stepingreds do |t|
      t.integer :recipe_id
      t.integer :step_id
      t.integer :ingredient_id
      t.float :amount

      t.timestamps
    end
  end
end
