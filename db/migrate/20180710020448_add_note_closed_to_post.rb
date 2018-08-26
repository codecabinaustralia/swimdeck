class AddNoteClosedToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :note_closed, :boolean
  end
end
