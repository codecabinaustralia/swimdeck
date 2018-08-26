class AddSkillToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :skill, foreign_key: true
  end
end
