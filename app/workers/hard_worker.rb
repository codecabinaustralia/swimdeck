class HardWorker

  include Sidekiq::Worker
  sidekiq_options retry:false

  def perform()
  	

	@links = Link.all

  	@links.each do |link|

  	if link.StuSurname != "----------"
  		# LESSON LEVEL 

  		if link.LessonLevel == "00 SPLASH"
  			@current_level = 1
  		end
		if link.LessonLevel == "01 DIS 1"
			@current_level = 2
		end
		if link.LessonLevel == "02 DIS 2"
			@current_level = 3
		end
		if link.LessonLevel == "03 DIS 3"
			@current_level = 4
		end
		if link.LessonLevel == "04 NWST"
			@current_level = 5
		end
		if link.LessonLevel == "05 LRN 1"
			@current_level = 6
		end
		if link.LessonLevel == "06 LRN 2"
			@current_level = 7
		end
		if link.LessonLevel == "07 INT 1"
			@current_level = 8
		end
		if link.LessonLevel == "08 INT 2"
			@current_level = 9
		end
		if link.LessonLevel == "09 ADV 1"
			@current_level = 10
		end
		if link.LessonLevel == "10 ADV 2"
			@current_level = 11
		end
		if link.LessonLevel == "11 ACH 1"
			@current_level = 12
		end
		if link.LessonLevel == "12 ACH 2"
			@current_level = 13
		end

		  

		# DOB FORMAT

		if link.StuDateOfBirth.present?
			require 'date'
			require 'time'
		  	begin
		  	   @dob = Date.parse(link.StuDateOfBirth.to_date.strftime("%Y-%m-%d"))
		  	rescue ArgumentError
		  	   @dob = nil
		  	end
	  	end

	  	#@lesson_start = link.StuBookStartDate.to_date.strftime("%Y-%m-%d") + " " + link.LessonTime.to_time.strftime("%I:%M:00")

	  	if link.LessonDay == "Monday"
	  		@new_date = Date.parse(link.StuBookStartDate).next_occurring(:monday)
	  	elsif link.LessonDay == "Tuesday"
	  		@new_date = Date.parse(link.StuBookStartDate).next_occurring(:tuesday)
	  	elsif link.LessonDay == "Wednesday"
	  		@new_date = Date.parse(link.StuBookStartDate).next_occurring(:wednesday)
	  	elsif link.LessonDay == "Thursday"
	  		@new_date = Date.parse(link.StuBookStartDate).next_occurring(:thursday)
	  	elsif link.LessonDay == "Friday"
	  		@new_date = Date.parse(link.StuBookStartDate).next_occurring(:friday)
	  	elsif link.LessonDay == "Saturday"
	  		@new_date = Date.parse(link.StuBookStartDate).next_occurring(:saturday)
	  	elsif link.LessonDay == "Sunday"
	  		@new_date = Date.parse(link.StuBookStartDate).next_occurring(:sunday)
	  	end

	  	@new_time = DateTime.strptime("#{@new_date} #{link.LessonTime}", "%Y-%m-%d %I:%M%p").strftime("%Y-%m-%d %I:%M")
		@time_reformat = @new_time

	  	#Add Teacher User
	   	#Create User/Client/Parent Login

	   	@find_teacher = User.find_or_create_by(email: "#{link.TeachGivenNames.downcase}.#{link.TeachSurname.downcase}@rackleyswimming.com.au") do |user|
	   	  user.password = "Rackley!23"
	   	  user.password_confirmation = "Rackley!23"
	   	  user.admin = false
	   	  user.manager = false
	   	  user.pool_deck_leader = false
	   	  user.teacher = true
	   	  user.customer_service = false
	   	  user.client = false
	   	  user.first_name = link.TeachGivenNames
	   	  user.last_name = link.TeachSurname
	   	end
	   	

	  	@find_lesson = Lesson.find_or_create_by(
	  		start_time: @time_reformat,
	  		user_id: @find_teacher.id,
	  		site_id: 1,
	  		level_id: @current_level
	  		)

	  	

	  	@find_student = Student.find_or_create_by(
	  		first_name: link.StuGivenNames,
	  		last_name: link.StuSurname,
	  		dob: @dob,
	  		personal_notes: 1,
	  		current_level: @current_level
	  		)

	  	# LESSON PARTICPANT

	  	@lesson_participant = LessonParticipant.find_or_create_by(
	  		lesson_id: @find_lesson.id,
	  		student_id: @find_student.id
	  	)

	  	#Create User/Client/Parent Login

	  	@user_p = User.find_or_create_by(email: link.RPEmail) do |user|
	  		user.password = "Test123"
	  		user.password_confirmation = "Test123"
	  		user.admin = false
	  		user.manager = false
	  		user.pool_deck_leader = false
	  		user.teacher = false
	  		user.customer_service = false
	  		user.client = true
	  		user.first_name = link.RPGivenNames
	  		user.last_name = link.RPSurname
	  	end


		#Create Client
		@find_client = Client.find_or_create_by(
			user_id: @c_user,
			first_name: link.RPGivenNames,
			last_name: link.RPSurname,
			phone_1: link.RPPhone,
			phone_2: link.RPWorkPhone,
			address: link.RPAddress,
			address_city: link.RPSuburb,
			address_state: "QLD",
			address_postcode: link.RPPostCode
			)
	

		#Attach user to student
		@find_parent = ClientStudent.find_or_create_by(
			client_id: @find_client,
	  		student_id: @find_student
	  	)
	  	

	end
	end

	#Add skills 
	@students = Student.all

  	@students.each do |student|

  	@skills = Skill.where(level_id: student.current_level).all
		@skills.each do |skill|
		StudentSkill.find_or_create_by(
	  		student_id: student.id,
	  		skill_id: skill.id,
	  		level_id: student.current_level,
	  		competency_level_id: 1
	  	)
		end
	end

  end
end
