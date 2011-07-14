class FixColumnSpelling < ActiveRecord::Migration
  def up
    rename_column :steps, :intruction, :instruction
  end

  def down
    rename_column :steps, :instruction, :intruction
  end
end
