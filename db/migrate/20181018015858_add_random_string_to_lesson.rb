class AddRandomStringToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :random_string, :string
  end
end
