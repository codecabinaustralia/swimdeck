class CreateStudentSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :student_skills do |t|
      t.references :student, foreign_key: true
      t.references :skill, foreign_key: true
      t.references :level, foreign_key: true
      t.references :competency_level, foreign_key: true

      t.timestamps
    end
  end
end
