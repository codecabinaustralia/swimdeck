class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.text :personal_notes
      t.integer :current_level

      t.timestamps
    end
  end
end
