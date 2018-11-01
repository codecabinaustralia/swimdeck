class LessonWorker

  include Sidekiq::Worker
  sidekiq_options retry:false

  def perform()
  	
  	#Delete all Lesson Participants and Lessons if they were created more than 5 days ago.
  	#LessonParticipant.delete_all("created_at < '#{5.days.ago}'")
    #Lesson.delete_all("created_at < '#{5.days.ago}'")

  	@time_brisbane = Time.now + 10.hours
	@links = Link.where(LessonDay: @time_brisbane.strftime('%A').to_s).all

	require 'securerandom'
	require 'date'

	@random_string = SecureRandom.hex

  	@links.each do |link|

  	@new_start_date = Date.parse(link.StuBookStartDate.to_date.strftime("%d/%m/%Y")).to_s
  	@new_start_date = Date.parse(@new_start_date)

  	@new_brisbane = @time_brisbane.strftime("%d/%m/%Y").to_s
  	@new_brisbane = Date.parse(@new_brisbane)

  	if @new_start_date <= @new_brisbane

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
			  	begin
			  	   @dob = Date.parse(link.StuDateOfBirth.to_date.strftime("%Y-%m-%d"))
			  	rescue ArgumentError
			  	   @dob = nil
			  	end
		  	end

		  	#Add Teacher User
		   	#Create User/Client/Parent Login
		   	@teacher = User.where(last_name: link.TeachSurname).where(first_name: link.TeachGivenNames).last

		   	if @teacher.blank?
		 	  	@t_user = User.new(
		 	  		email: "#{link.TeachGivenNames.downcase.parameterize}#{link.TeachSurname.downcase.parameterize}@rackleyswimming.com.au",
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
		 	  	@t_user.save
		 	else
		 		@t_user = @teacher
		 	end

		 	l_start_date = Date.parse(link.StuBookStartDate, "%d %b %Y")
		  	l_start_date = Date.new(l_start_date.strftime("%Y").to_i,l_start_date.strftime("%m").to_i,l_start_date.strftime("%d").to_i)

		  	@find_lesson = Lesson.where(
		  		lesson_day: link.LessonDay
		  		).where(
			  	lesson_time: link.LessonTime,
		  		).where(
		  		area: link.Area #Area
		  		).where(
		  		level_id: current_level,
		  		).last

		  	if @find_lesson.blank?
		  		
			  		lesson = Lesson.create(
				  		lesson_date: link.StuBookStartDate,
				  		lesson_time: link.LessonTime,
				  		lesson_day: link.LessonDay,
				  		area: link.Area,
				  		user_id: @t_user.id, #Teacher placeholder 3
				  		site_id: 1, #Site placeholder 1
				  		level_id: current_level
			  		)
		  	else
		  		@find_lesson.update_attributes(
			  		user_id: @t_user.id
		  		)
		  		lesson = @find_lesson
		  		
		  	end

	  	   
		  	

		  	@find_student = Student.where(
		  		first_name: link.StuGivenNames).where(
		  		last_name: link.StuSurname).where(
		  		dob: @dob).last

		  	if @find_student.blank?
		  	student = Student.create(
		  		first_name: link.StuGivenNames,
		  		last_name: link.StuSurname,
		  		dob: @dob,
		  		personal_notes: 1,
		  		current_level: current_level,
		  		)
		  	else
		  	@find_student.update_attributes(
		  		current_level: current_level
		  		)
		  	student = @find_student
		  	end


		  	# LESSON PARTICPANT

		  	@find_participant = LessonParticipant.where(
		  		lesson_id: lesson.id,
		  		student_id: student.id
		  	).last

			  	if @find_participant.blank?
					  	lesson_participant = LessonParticipant.create(
					  		lesson_id: lesson.id,
					  		student_id: student.id,
					  		random_string: @random_string
					  	)
					
			    else
			    	lesson_participant = @find_participant
			    	@find_participant.update_attributes(random_string: @random_string)
			    end
			
			    # Delete all lesson and participants if random string doesn't match
		  

		    @get_old_participants = LessonParticipant.where.not(
		  		random_string: @random_string
		  	).all

		    @get_old_participants.each do |oldie|
		  		oldie.destroy
		 	end

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
			@find_client = Client.where(
				user_id: c_user.id).last
				

			if @find_client.blank?
				client = Client.create(
					user_id: c_user.id,
					first_name: link.RPGivenNames,
					last_name: link.RPSurname,
					phone_1: link.RPPhone,
					phone_2: link.RPWorkPhone,
					address: link.RPAddress,
					address_city: link.RPSuburb,
					address_state: "QLD",
					address_postcode: link.RPPostCode,
				)
			else
				@find_client.update_attributes(
					first_name: link.RPGivenNames,
					last_name: link.RPSurname,
					phone_1: link.RPPhone,
					phone_2: link.RPWorkPhone,
					address: link.RPAddress,
					address_city: link.RPSuburb,
					address_state: "QLD",
					address_postcode: link.RPPostCode
				)
				client = @find_client
			end

			#Attach user to student
			@find_parent = ClientStudent.where(
				client_id: client.id).where(
		  		student_id: student.id).last

		  	if @find_parent.blank?
				parent = ClientStudent.create(
			  		client_id: client.id,
			  		student_id: student.id
			  	)
			else
				parent = @find_parent
			end

		end
	end
end
	end

	#Add skills 
	#REMINDER REMOVE SKILLS IF LEVELID DOESN'T MATCH FOUND SKILLID
    @students = Student.all

    @students.each do |student|

    @skills = Skill.where(level_id: student.current_level).all
    
    @skills.each do |skill|
	    @find_skill = StudentSkill.where(skill_id: skill.id).where(student_id: student.id).last
	    
	    if @find_skill.blank?
		    new_skill = StudentSkill.create(
		        student_id: student.id,
		        skill_id: skill.id,
		        level_id: student.current_level,
		        competency_level_id: 1
		    )
		else
			new_skill = @find_skill
		end

    end
  end

end
end