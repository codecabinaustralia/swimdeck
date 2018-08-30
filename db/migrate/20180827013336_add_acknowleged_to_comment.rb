class AddAcknowlegedToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :acknowleged, :boolean
  end
end
