class AddLessonDayToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :lesson_day, :string
  end
end
