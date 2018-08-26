class AddLevelIdToLesson < ActiveRecord::Migration[5.2]
  def change
    add_reference :lessons, :level, foreign_key: true
  end
end
