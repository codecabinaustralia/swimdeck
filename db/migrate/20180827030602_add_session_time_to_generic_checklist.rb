class AddSessionTimeToGenericChecklist < ActiveRecord::Migration[5.2]
  def change
    add_column :generic_checklists, :session_time, :string
  end
end
