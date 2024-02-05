class AddNameToRoutines < ActiveRecord::Migration[7.0]
  def change
    add_column :routines, :name, :string
  end
end
