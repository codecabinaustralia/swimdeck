class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :student, foreign_key: true
      t.references :user, foreign_key: true
      t.string :clients
      t.text :body

      t.timestamps
    end
  end
end
