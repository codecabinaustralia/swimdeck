class AddAreaToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :area, :string
  end
end
