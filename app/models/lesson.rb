class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :site
  belongs_to :level
  require 'date'
  require 'time'

  def custom_method
  	Date.strptime(lesson_time, '%-I:%M%p').strftime('%I%M%p')
  end

end
