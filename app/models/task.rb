class Task < ApplicationRecord
  belongs_to :user
  belongs_to :student, required: false
end
