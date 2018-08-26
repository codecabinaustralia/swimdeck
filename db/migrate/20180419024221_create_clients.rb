class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :phone_1
      t.string :phone_2
      t.string :address
      t.string :address_city
      t.string :address_state
      t.string :address_postcode

      t.timestamps
    end
  end
end
