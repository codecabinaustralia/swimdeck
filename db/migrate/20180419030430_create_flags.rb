class CreateFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :flags do |t|
      t.string :title
      t.integer :number_of_days

      t.timestamps
    end
  end
end
