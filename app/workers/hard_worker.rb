class HardWorker

  include Sidekiq::Worker
  sidekiq_options retry:false

  def perform()
  	

	@links = Link.all

  	@links.each do |link|

  	if link.StuSurname != "----------"
  		# LESSON LEVEL 

  		if link.LessonLevel == "00 SPLASH"
  			current_level = 1
  		end
		if link.LessonLevel == "01 DIS 1"
			current_level = 2
		end
		if link.LessonLevel == "02 DIS 2"
			current_level = 3
		end
		if link.LessonLevel == "03 DIS 3"
			current_level = 4
		end
		if link.LessonLevel == "04 NWST"
			current_level = 5
		end
		if link.LessonLevel == "05 LRN 1"
			current_level = 6
		end
		if link.LessonLevel == "06 LRN 2"
			current_level = 7
		end
		if link.LessonLevel == "07 INT 1"
			current_level = 8
		end
		if link.LessonLevel == "08 INT 2"
			current_level = 9
		end
		if link.LessonLevel == "09 ADV 1"
			current_level = 10
		end
		if link.LessonLevel == "10 ADV 2"
			current_level = 11
		end
		if link.LessonLevel == "11 ACH 1"
			current_level = 12
		end
		if link.LessonLevel == "12 ACH 2"
			current_level = 13
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
	  		@myday = :monday
	  	elsif link.LessonDay == "Tuesday"
	  		@myday = :tuesday
	  	elsif link.LessonDay == "Wednesday"
	  		@myday = :wednesday
	  	elsif link.LessonDay == "Thursday"
	  		@myday = :thursday
	  	elsif link.LessonDay == "Friday"
	  		@myday = :friday
	  	elsif link.LessonDay == "Saturday"
	  		@myday = :saturday
	  	elsif link.LessonDay == "Sunday"
	  		@myday = :sunday
	  	end

	  	@new_date = Date.parse(link.StuBookStartDate).next_occurring(@myday.to_sym)
	  	@lesson_start_time = Time.strptime("7:00AM", "%H:%M")

		@lesson_start = "#{@new_date.to_s} #{@lesson_start_time.to_s}"

	  	@time_reformat = @lesson_start.to_date.strftime("%Y-%m-%d %H:%M%p")
	  	@lesson_finish = @time_reformat

	  	#Add Teacher User
	   	#Create User/Client/Parent Login

 	  	find_teacher = User.new(
 	  		email: "#{link.TeachGivenNames.downcase}#{link.TeachSurname.downcase}@rackleyswimming.com.au",
 	  		password: "Test123",
 	  		password_confirmation: "Test123", 
 	  		current_sign_in_at: DateTime.now,
 	  		last_sign_in_at: DateTime.now,
 	  		created_at: DateTime.now,
 	  		admin: false,
 	  		manager: false,
 	  		pool_deck_leader: false,
 	  		teacher: true,
 	  		customer_service: false,
 	  		client: false,
 	  		first_name: link.TeachGivenNames,
 	  		last_name: link.TeachSurname
 	  		)
 	  	find_teacher.save


	  	find_lesson = Lesson.find_or_create_by(
	  		user_id: find_teacher.id,
	  		site_id: 1,
	  		level_id: current_level
	  		)

	  	

	  	find_student = Student.find_or_create_by(
	  		first_name: link.StuGivenNames,
	  		last_name: link.StuSurname,
	  		dob: @dob,
	  		personal_notes: 1,
	  		current_level: current_level
	  		)

	  	# LESSON PARTICPANT

	  	lesson_participant = LessonParticipant.find_or_create_by(
	  		lesson_id: find_lesson.id,
	  		student_id: find_student.id
	  	)

	  	#Create User/Client/Parent Login
	  	@user = User.where(email: link.RPEmail).last

	  	if @user.blank?
		  	c_user = User.new(
		  		email: link.RPEmail,
		  		password: "Test123",
		  		password_confirmation: "Test123", 
		  		current_sign_in_at: DateTime.now,
		  		last_sign_in_at: DateTime.now,
		  		created_at: DateTime.now,
		  		admin: false,
		  		manager: false,
		  		pool_deck_leader: false,
		  		teacher: false,
		  		customer_service: false,
		  		client: true,
		  		first_name: link.RPGivenNames,
		  		last_name: link.RPSurname
		  		)
		  	c_user.save
		else
			c_user = @user
		end

		#Create Client
		find_client = Client.find_or_create_by(
			user_id: c_user.id,
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
		find_parent = ClientStudent.find_or_create_by(
			client_id: find_client.id,
	  		student_id: find_student.id
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
