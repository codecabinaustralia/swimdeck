class AddNoteToFlag < ActiveRecord::Migration[5.2]
  def change
    add_column :flags, :note, :text
  end
end
