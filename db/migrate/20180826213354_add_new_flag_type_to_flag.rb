class AddNewFlagTypeToFlag < ActiveRecord::Migration[5.2]
  def change
    add_column :flags, :flag_type, :string
  end
end
