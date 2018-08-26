class ChangeStartTimesToBeDateTimeInLessons < ActiveRecord::Migration[5.2]
  def change
  	change_column :lessons, :start_time, :datetime
  	change_column :lessons, :finish_time, :datetime
  end
end
