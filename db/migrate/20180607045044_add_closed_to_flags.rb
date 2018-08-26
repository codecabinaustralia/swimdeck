class AddClosedToFlags < ActiveRecord::Migration[5.2]
  def change
    add_column :flags, :closed, :boolean
  end
end
