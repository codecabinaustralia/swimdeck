class Task < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :student, required: false
end
