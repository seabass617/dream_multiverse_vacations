class AddPhotoToDimensions < ActiveRecord::Migration[6.0]
  def change
    add_column :dimensions, :photo, :string
  end
end
