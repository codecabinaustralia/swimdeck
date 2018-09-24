class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :site
  belongs_to :level
  require 'date'
  require 'time'

 def custom_method
 	Time.parse("2011-04-12 #{lesson_time}")
 end



end
