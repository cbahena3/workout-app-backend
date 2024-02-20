class AddImageUrlToMuscleGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :muscle_groups, :image_url, :string
  end
end
