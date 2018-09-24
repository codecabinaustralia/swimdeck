class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :site
  belongs_to :level
  require 'date'
  require 'time'

 def custom_method
  date_time_new = Date.strptime("01/01/2000" + lesson_time, '%d/%m/%Y %-I:%M%p').strftime('%I%M%p')
  Date.new(date_time_new).strftime('%I%M%p')
 end



end
