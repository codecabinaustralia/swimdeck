class Lesson < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :site
  belongs_to :level
end
