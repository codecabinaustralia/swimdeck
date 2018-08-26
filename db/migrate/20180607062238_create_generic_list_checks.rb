class CreateGenericListChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :generic_list_checks do |t|
      t.references :generic_checklist, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
