class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :site
  belongs_to :level

  def sortable_date
  	lesson_time
  end
end
