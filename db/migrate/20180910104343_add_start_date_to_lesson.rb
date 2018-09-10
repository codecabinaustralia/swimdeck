class AddStartDateToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :lesson_date, :string
    add_column :lessons, :lesson_time, :string
  end
end
