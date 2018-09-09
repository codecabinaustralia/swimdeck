class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :site
  belongs_to :level
end
