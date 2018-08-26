class CreateGenericChecklistStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :generic_checklist_statuses do |t|
      t.references :generic_check_list, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
