class AddGetToKnowToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :get_to_know, :text
  end
end
