class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.date :date_issued
      t.references :user, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
