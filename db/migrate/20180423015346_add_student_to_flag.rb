class AddStudentToFlag < ActiveRecord::Migration[5.2]
  def change
    add_reference :flags, :student, foreign_key: true
  end
end
