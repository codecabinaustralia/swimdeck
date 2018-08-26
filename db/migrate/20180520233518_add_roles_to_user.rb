class AddRolesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :manager, :boolean
    add_column :users, :pool_deck_leader, :boolean
    add_column :users, :teacher, :boolean
    add_column :users, :customer_service, :boolean
  end
end
