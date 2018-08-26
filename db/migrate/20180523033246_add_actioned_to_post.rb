class AddActionedToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :actioned, :boolean
  end
end
