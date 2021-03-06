class DataScraperController < ApplicationController

  def delete_all_lesson_data
    RemovableWorker.perform_async()
  end

  def add_links_data
	LinksWorker.perform_async()
  end

  def add_lessons
  	LessonWorker.perform_async()
  end
  

  def csv_spider

Skill.create(title: "Feel comfortable in the water", level_id: 1, rank_id: 1)
Skill.create(title: "Front float with assistance", level_id: 1, rank_id: 2)
Skill.create(title: "Back Float with assistance", level_id: 1, rank_id: 3)
Skill.create(title: "Kick", level_id: 1, rank_id: 4)
Skill.create(title: "Welcome song", level_id: 2, rank_id: 5)
Skill.create(title: "Cuddle kicks", level_id: 2, rank_id: 6)
Skill.create(title: "Ball swim", level_id: 2, rank_id: 7)
Skill.create(title: "Breath control", level_id: 2, rank_id: 8)
Skill.create(title: "Front float", level_id: 2, rank_id: 9)
Skill.create(title: "Back float", level_id: 2, rank_id: 10)
Skill.create(title: "Humpty Dumpty", level_id: 2, rank_id: 11)
Skill.create(title: "Circuit", level_id: 2, rank_id: 12)
Skill.create(title: "Goodbye song", level_id: 2, rank_id: 13)
Skill.create(title: "Welcome song", level_id: 3, rank_id: 14)
Skill.create(title: "Cuddle kicks", level_id: 3, rank_id: 15)
Skill.create(title: "Paddling hands", level_id: 3, rank_id: 16)
Skill.create(title: "Breath control", level_id: 3, rank_id: 17)
Skill.create(title: "Front swim", level_id: 3, rank_id: 18)
Skill.create(title: "Mat run", level_id: 3, rank_id: 19)
Skill.create(title: "Back pancake flip", level_id: 3, rank_id: 20)
Skill.create(title: "Humpty Dumpty", level_id: 3, rank_id: 21)
Skill.create(title: "Tunnel circuit", level_id: 3, rank_id: 22)
Skill.create(title: "Toy pick up", level_id: 3, rank_id: 23)
Skill.create(title: "Seated kicking", level_id: 4, rank_id: 24)
Skill.create(title: "Swim – cuddle kicks - swim", level_id: 4, rank_id: 25)
Skill.create(title: "Swim – platform -swim", level_id: 4, rank_id: 26)
Skill.create(title: "Back pancake flip", level_id: 4, rank_id: 27)
Skill.create(title: "Humpty Dumpty", level_id: 4, rank_id: 28)
Skill.create(title: "Independent circuit", level_id: 4, rank_id: 29)
Skill.create(title: "Toy pick up", level_id: 4, rank_id: 30)
Skill.create(title: "Seated kicking", level_id: 5, rank_id: 31)
Skill.create(title: "Floating and kicking on mat", level_id: 5, rank_id: 32)
Skill.create(title: "Floating and kicking with teacher", level_id: 5, rank_id: 33)
Skill.create(title: "Dog paddle hands", level_id: 5, rank_id: 34)
Skill.create(title: "5m Dog paddle swim", level_id: 5, rank_id: 35)
Skill.create(title: "Back float", level_id: 5, rank_id: 36)
Skill.create(title: "Flip swimming", level_id: 5, rank_id: 37)
Skill.create(title: "Jump in and turn around", level_id: 5, rank_id: 38)
Skill.create(title: "Kicking practice on poolside", level_id: 6, rank_id: 39)
Skill.create(title: "Face in kicking for ‘10’ with board", level_id: 6, rank_id: 40)
Skill.create(title: "5m dog paddle swim", level_id: 6, rank_id: 41)
Skill.create(title: "Back float", level_id: 6, rank_id: 42)
Skill.create(title: "5m flip swimming", level_id: 6, rank_id: 43)
Skill.create(title: "Jump in and turn around", level_id: 6, rank_id: 44)
Skill.create(title: "Goggle pick up", level_id: 6, rank_id: 45)
Skill.create(title: "Kicking practice on poolside", level_id: 7, rank_id: 46)
Skill.create(title: "5m streamline float", level_id: 7, rank_id: 47)
Skill.create(title: "5m streamline kicking", level_id: 7, rank_id: 48)
Skill.create(title: "Starfish (X) float", level_id: 7, rank_id: 49)
Skill.create(title: "5m flip swimming", level_id: 7, rank_id: 50)
Skill.create(title: "Back kicking", level_id: 7, rank_id: 51)
Skill.create(title: "Jump in and turn around", level_id: 7, rank_id: 52)
Skill.create(title: "Goggle pick up", level_id: 7, rank_id: 53)
Skill.create(title: "Kicking practice", level_id: 8, rank_id: 54)
Skill.create(title: "5m streamline kicking", level_id: 8, rank_id: 55)
Skill.create(title: "4-6 catch up arms", level_id: 8, rank_id: 56)
Skill.create(title: "Y back float", level_id: 8, rank_id: 57)
Skill.create(title: "5m back kicking", level_id: 8, rank_id: 58)
Skill.create(title: "4-6 backstroke arms with board", level_id: 8, rank_id: 59)
Skill.create(title: "Handstand", level_id: 8, rank_id: 60)
Skill.create(title: "Freestyle arm revision", level_id: 9, rank_id: 61)
Skill.create(title: "12m freestyle breathing", level_id: 9, rank_id: 62)
Skill.create(title: "12m one arm freestyle with board", level_id: 9, rank_id: 63)
Skill.create(title: "12m catch up freestyle with board", level_id: 9, rank_id: 64)
Skill.create(title: "12m catch up freestyle swim", level_id: 9, rank_id: 65)
Skill.create(title: "12m streamline backstroke kicking", level_id: 9, rank_id: 66)
Skill.create(title: "12m backstroke swim", level_id: 9, rank_id: 67)
Skill.create(title: "Assisted somersault", level_id: 9, rank_id: 68)
Skill.create(title: "20m freestyle kick and breathing revision", level_id: 10, rank_id: 69)
Skill.create(title: "20m catch up freestyle swim", level_id: 10, rank_id: 70)
Skill.create(title: "12m breaststroke kick", level_id: 10, rank_id: 71)
Skill.create(title: "20m backstroke kick", level_id: 10, rank_id: 72)
Skill.create(title: "20m 6 kick change backstroke", level_id: 10, rank_id: 73)
Skill.create(title: "4-6 butterfly kicks", level_id: 10, rank_id: 74)
Skill.create(title: "Somersaults", level_id: 10, rank_id: 75)
Skill.create(title: "20m continuous arms freestyle swim", level_id: 11, rank_id: 76)
Skill.create(title: "20m continuous arms backstroke", level_id: 11, rank_id: 77)
Skill.create(title: "12m breaststroke kick", level_id: 11, rank_id: 78)
Skill.create(title: "12m full stroke breaststroke", level_id: 11, rank_id: 79)
Skill.create(title: "12m butterfly kick", level_id: 11, rank_id: 80)
Skill.create(title: "12m one arm butterfly drill", level_id: 11, rank_id: 81)
Skill.create(title: "Tumble turns", level_id: 11, rank_id: 82)
Skill.create(title: "Freestyle development", level_id: 12, rank_id: 83)
Skill.create(title: "Backstroke development", level_id: 12, rank_id: 84)
Skill.create(title: "Breaststroke development", level_id: 12, rank_id: 85)
Skill.create(title: "Butterfly development", level_id: 12, rank_id: 86)
Skill.create(title: "Skills", level_id: 12, rank_id: 87)
Skill.create(title: "Dives", level_id: 12, rank_id: 88)
Skill.create(title: "Warm up", level_id: 13, rank_id: 89)
Skill.create(title: "Freestyle development", level_id: 13, rank_id: 90)
Skill.create(title: "Backstroke development", level_id: 13, rank_id: 91)
Skill.create(title: "Breaststroke development", level_id: 13, rank_id: 92)
Skill.create(title: "Butterfly development", level_id: 13, rank_id: 93)

redirect_to root_path
  end



  def tester
  	
@time_brisbane = Time.now + 10.hours
	@links = Link.where(LessonDay: @time_brisbane.strftime('%A').to_s).all

	require 'securerandom'
	require 'date'

	@random_string = SecureRandom.hex

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
	  		if Date.today >= l_start_date
		  		lesson = Lesson.create(
			  		lesson_date: link.StuBookStartDate,
			  		lesson_time: link.LessonTime,
			  		lesson_day: link.LessonDay,
			  		area: link.Area,
			  		user_id: @t_user.id, #Teacher placeholder 3
			  		site_id: 1, #Site placeholder 1
			  		level_id: current_level,
		  		)
	  		end
	
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
	  		if Date.today >= l_start_date
			  	lesson_participant = LessonParticipant.create(
			  		lesson_id: lesson.id,
			  		student_id: student.id,
			  		random_string: @random_string
			  	)
			end
	    else
	    	lesson_participant = @find_participant
	    end

	    @get_old_participants = LessonParticipant.where.not(
	  		random_string: @random_string
	  	).all

	    @get_old_participants.each do |oldie|
	  		oldie.update_attributes(
	  			cancelled: true
	  			)
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

  def delete_tester
  	@student_skills = StudentSkill.all
  	@lesson_participants = LessonParticipant.all
  	@client_students = ClientStudent.all
  	@clients = Client.all
  	@students = Student.all
  	@lessons = Lesson.all
	@users = User.where.not(email: "josh@codecabin.com.au").all

	@student_skills.destroy_all
	@lesson_participants.destroy_all
	@client_students.destroy_all
	@clients.destroy_all
	@students.destroy_all
	@lessons.destroy_all
	@users.destroy_all
  end

end


