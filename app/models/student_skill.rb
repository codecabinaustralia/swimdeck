class StudentSkill < ApplicationRecord
  belongs_to :student
  belongs_to :skill
  belongs_to :level
  belongs_to :competency_level
end
