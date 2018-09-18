class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :site
  belongs_to :level


  def custom_method
  	Time.strptime(lesson_time, '%H:%M%p').strftime('%I%M%p')
  end

end
