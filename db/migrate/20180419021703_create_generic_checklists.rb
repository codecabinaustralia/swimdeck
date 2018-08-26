class CreateGenericChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :generic_checklists do |t|
      t.string :title
      t.text :description
      t.references :site, foreign_key: true
      
      t.timestamps
    end
  end
end
