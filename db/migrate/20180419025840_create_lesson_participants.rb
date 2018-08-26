class CreateLessonParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_participants do |t|
      t.references :lesson, foreign_key: true
      t.references :student, foreign_key: true
      t.boolean :makeup_session
      t.boolean :new_lesson

      t.timestamps
    end
  end
end
