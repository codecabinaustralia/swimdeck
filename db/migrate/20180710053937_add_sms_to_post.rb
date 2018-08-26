class AddSmsToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :sms, :boolean
  end
end
