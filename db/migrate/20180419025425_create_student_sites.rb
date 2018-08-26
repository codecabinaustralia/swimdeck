class CreateStudentSites < ActiveRecord::Migration[5.2]
  def change
    create_table :student_sites do |t|
      t.references :student, foreign_key: true
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
