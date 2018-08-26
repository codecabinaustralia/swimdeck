class CreateClientSites < ActiveRecord::Migration[5.2]
  def change
    create_table :client_sites do |t|
      t.references :client, foreign_key: true
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
