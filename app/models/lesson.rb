class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :site
  belongs_to :level
  require 'date'
  require 'time'

 def custom_method
 	Time.parse("2018-09-24 #{lesson_time}")
 end



end
