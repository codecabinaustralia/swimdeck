class AddCompetentButWaitingToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :competent_but_waiting, :boolean
  end
end
