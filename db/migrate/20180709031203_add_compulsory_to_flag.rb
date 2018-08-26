class AddCompulsoryToFlag < ActiveRecord::Migration[5.2]
  def change
    add_column :flags, :compulsory_note, :boolean
  end
end
