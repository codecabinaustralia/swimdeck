class Flag < ApplicationRecord
	belongs_to :student, required: false
end
