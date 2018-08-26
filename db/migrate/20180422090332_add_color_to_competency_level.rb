class AddColorToCompetencyLevel < ActiveRecord::Migration[5.2]
  def change
    add_column :competency_levels, :color, :string
  end
end
