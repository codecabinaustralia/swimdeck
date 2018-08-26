class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :title
      t.references :level, foreign_key: true
      t.integer :rank_id

      t.timestamps
    end
  end
end
