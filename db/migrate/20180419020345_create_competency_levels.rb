class CreateCompetencyLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :competency_levels do |t|
      t.string :title

      t.timestamps
    end
  end
end
