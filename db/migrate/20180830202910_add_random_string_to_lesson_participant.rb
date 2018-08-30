class AddRandomStringToLessonParticipant < ActiveRecord::Migration[5.2]
  def change
    add_column :lesson_participants, :random_string, :string
  end
end
