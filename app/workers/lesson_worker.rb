class LessonWorker

  include Sidekiq::Worker
  sidekiq_options retry:false

  def perform()
  	
	require 'date'
  	require 'time'
  	#Find all links
  	@links = Link.all

  	#Delete the first row containing ------------
  	@links.first.destroy

  	#Loop through all links
  	@links.each do |link|

  		#We'll need to determin the level of the lesson
  		if link.LessonLevel == "00 SPLASH"
  			@current_level = 1
		elsif link.LessonLevel == "01 DIS 1"
			@current_level = 2
		elsif link.LessonLevel == "02 DIS 2"
			@current_level = 3
		elsif link.LessonLevel == "03 DIS 3"
			@current_level = 4
		elsif link.LessonLevel == "04 NWST"
			@current_level = 5
		elsif link.LessonLevel == "05 LRN 1"
			@current_level = 6
		elsif link.LessonLevel == "06 LRN 2"
			@current_level = 7
		elsif link.LessonLevel == "07 INT 1"
			@current_level = 8
		elsif link.LessonLevel == "08 INT 2"
			@current_level = 9
		elsif link.LessonLevel == "09 ADV 1"
			@current_level = 10
		elsif link.LessonLevel == "10 ADV 2"
			@current_level = 11
		elsif link.LessonLevel == "11 ACH 1"
			@current_level = 12
		elsif link.LessonLevel == "12 ACH 2"
			@current_level = 13
		end


		#Let's refactor the birthdate
		if link.StuDateOfBirth.present?
		  	begin
		  	   @dob = Date.parse(link.StuDateOfBirth.to_date.strftime("%Y-%m-%d"))
		  	rescue ArgumentError
		  	   @dob = nil
		  	end
	  	end

	  	# Before we create the lessons we'll need to detirmine a start time. 
	  	# The start time is the following link.LessonDay from link.StuBookStartDate
	  	@parsed_date = Date.parse(link.StuBookStartDate)
	  	if link.LessonDay == "Monday"
	  		@new_date = @parsed_date.next_occurring(:monday).strftime('%d %b %Y')
	  	elsif link.LessonDay == "Tuesday"
	  		@new_date = @parsed_date.next_occurring(:tuesday).strftime('%d %b %Y')
	  	elsif link.LessonDay == "Wednesday"
	  		@new_date = @parsed_date.next_occurring(:wednesday).strftime('%d %b %Y')
	  	elsif link.LessonDay == "Thursday"
	  		@new_date = @parsed_date.next_occurring(:thursday).strftime('%d %b %Y')
	  	elsif link.LessonDay == "Friday"
	  		@new_date = @parsed_date.next_occurring(:friday).strftime('%d %b %Y')
	  	elsif link.LessonDay == "Saturday"
	  		@new_date = @parsed_date.next_occurring(:saturday).strftime('%d %b %Y')
	  	elsif link.LessonDay == "Sunday"
	  		@new_date = @parsed_date.next_occurring(:sunday).strftime('%d %b %Y')
	  	end

  		#Now let's create a teacher
  		teacher = User.find_or_create_by(email: "#{link.TeachGivenNames}.#{link.TeachSurname}@rackleyswimming.com.au") do |user|
					user.password = "Test123"
					user.password_confirmation = "Test123"
					user.current_sign_in_at = DateTime.now
					user.last_sign_in_at = DateTime.now
					user.created_at = DateTime.now
					user.admin = false
					user.manager = false
					user.pool_deck_leader = false
					user.teacher = true
					user.customer_service = false
					user.client = false
					user.first_name = link.TeachGivenNames
					user.last_name = link.TeachSurname
				  end

		#Now to create the Lesson
		lesson = Lesson.find_or_create_by(user_id: teacher.id, lesson_date: @new_date, lesson_time: link.LessonTime) do |l|
				    l.level_id = @current_level
				 end

		#Let's create a student now
		student = Student.find_or_create_by(first_name: link.StuGivenNames, last_name: link.StuSurname, dob: @dob) do |s|
					s.personal_notes = 1
					s.current_level = @current_level
				  end

		#Now we can add the student to the lesson
		student_lesson = LessonParticipant.find_or_create_by(student_id: student.id, lesson_id: lesson.id)

		#The student needs a parent let's create a client/parent
		#first create the login / user
		parent = User.find_or_create_by(email: "#{link.RPEmail}") do |p|
					p.password = "Test123"
					p.password_confirmation = "Test123"
					p.current_sign_in_at = DateTime.now
					p.last_sign_in_at = DateTime.now
					p.created_at = DateTime.now
					p.admin = false
					p.manager = false
					p.pool_deck_leader = false
					p.teacher = false
					p.customer_service = false
					p.client = true
					p.first_name = link.RPGivenNames
					p.last_name = link.RPSurname
				  end

		#Now the client details record
		client = Client.find_or_create_by(user_id: parent.id, first_name: "#{link.RPGivenNames}", last_name: "#{link.RPSurname}") do |c|
			c.phone_1 = link.RPPhone
			c.phone_2 = link.RPWorkPhone
			c.address = link.RPAddress
			c.address_city = link.RPSuburb
			c.address_state = "QLD"
			c.address_postcode = link.RPPostCode
		end


		#Let's connect the student to the client
		student_client = ClientStudent.find_or_create_by(student_id: student.id, client_id: client.id)

		# Finally we can add the skills to the students
		# Currently we are just adding the skills from the @current_level and assigning them as incompetant
			
	    @students = Student.all
	    @students.each do |student|
		    @skills = Skill.where(level_id: student.current_level).all
		    @skills.each do |skill|
			    StudentSkill.find_or_create_by(student_id: student.id, skill_id: skill.id) do |sk|
					sk.level_id = student.current_level,
					sk.competency_level_id = 1
			    end
			end
	  	end
  	end

end
end
