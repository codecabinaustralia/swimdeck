class AddCancelledToLessonParticipant < ActiveRecord::Migration[5.2]
  def change
    add_column :lesson_participants, :cancelled, :boolean
  end
end
