class Student < ApplicationRecord
	has_many :flags
	has_one_attached :avatar
	acts_as_birthday :dob
	
	def full_name
		first_name + " " + last_name
	end

end
