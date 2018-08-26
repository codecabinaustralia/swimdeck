class CreatePushChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :push_checklists do |t|
      t.string :title
      t.text :description
      t.integer :manager_id
      t.references :user, foreign_key: true
      t.references :site, foreign_key: true
      t.date :date_issued
      t.boolean :completed

      t.timestamps
    end
  end
end
