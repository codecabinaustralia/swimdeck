class AddLevelToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :certificate, :boolean
    add_reference :posts, :level, foreign_key: true
  end
end
