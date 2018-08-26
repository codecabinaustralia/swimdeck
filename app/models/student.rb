class Student < ApplicationRecord
	has_many :flags
	has_one_attached :avatar
	
	def full_name
		first_name + " " + last_name
	end

end
