class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :site
  belongs_to :level

  def army_time
  	require 'date'
  	require 'time'

  	DateTime.strptime(LessonTime, "%H%M").strftime("%H%M")
  end

end
