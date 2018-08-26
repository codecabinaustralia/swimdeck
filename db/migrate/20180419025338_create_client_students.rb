class CreateClientStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :client_students do |t|
      t.references :client, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
