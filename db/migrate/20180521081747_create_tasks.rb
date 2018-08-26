class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.integer :target_user
      t.references :student, foreign_key: true
      t.string :title
      t.date :due_date
      t.boolean :completed

      t.timestamps
    end
  end
end
