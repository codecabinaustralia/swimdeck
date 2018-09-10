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



GenericChecklist.create(title: 'Pre', description: 'Set up for session, including lane ropes, kickboards, area signs are all in place and correct', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Pre', description: 'Attach name tag to your shirt or jumper', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Pre', description: 'Walk through toilets, reception & pool deck checking for any hazards or rubbish', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Pre', description: 'Place name signs for the Pool Deck Team Leader and Swim School Coordinator on the parent communication board, as well as absent teachers and replacements ', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Pre', description: 'Collect Teacher Timetables, Supervisor’s Report and Student Tracking Forms as well as any other messages for distribution during team huddle. If using SwimDesk ensure tablet has been fully charged.', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Pre', description: 'Review Reports for children in levels for extended periods, children experiencing issues or any other factors. Any issues or children who have not graduated during the past 6 months can be highlighted for follow up during the session as well as discussing these with the specific teacher during the team huddle.  ', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Pre', description: 'Make any last minute teacher changes on Links', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Pre', description: 'Meet and greet teachers and conduct Team Huddle focussing on Weekly Teaching Focuses and upcoming events and training ', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Pre', description: 'Assign trainees to mentor or senior teachers', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Pre', description: 'Teachers in water prior to start time', site_id: 1, session_time: 'am')

GenericChecklist.create(title: 'Post', description: 'Have teachers help to set up for PM/next session, or if pool to be used during the break, to store equipment', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Post', description: 'Meet with teachers to give feedback from Team Leader Report or discuss any compliments or issues raised by parents during the shift. Compliments should be followed up with a Feedback Card in their pigeon hole.', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Post', description: 'Check toilets and surrounds for rubbish, lost property or any safety hazards that may have arisen during the shift and bring to the attention of the Manager', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Post', description: 'Take down Team Leader sign from board', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Post', description: 'Check with Customer Service Team about any issues that may have arisen during the shift', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Post', description: 'Indicate on Pool Deck Team Leader Report any variations to the teaching shift, e.g. teachers who started late, or finished shift early due to non-attendance.s sheet. This allows Managers to confirm Zuus shifts more easily.', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Post', description: 'Ensure any last minute teacher absences for the following shift have been covered', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Post', description: 'Complete Team Leader Report and file for Coordinator review', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Post', description: 'Update Student Tracking Form on the computer for next session', site_id: 1, session_time: 'am')
GenericChecklist.create(title: 'Post', description: 'Print out teacher timetables, Team Leader report and Student Tracking Form for the next shift. If using SwimDesk, make sure all notes are up to date and tablet is put on the charger.', site_id: 1, session_time: 'am')

GenericChecklist.create(title: 'Pre', description: 'Set up for session, including lane ropes, kickboards, area signs are all in place and correct', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Pre', description: 'Attach name tag to your shirt or jumper', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Pre', description: 'Walk through toilets, reception & pool deck checking for any hazards or rubbish', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Pre', description: 'Place name signs for the Pool Deck Team Leader and Swim School Coordinator on the parent communication board, as well as absent teachers and replacements ', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Pre', description: 'Collect Teacher Timetables, Supervisor’s Report and Student Tracking Forms as well as any other messages for distribution during team huddle. If using SwimDesk ensure tablet has been fully charged.', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Pre', description: 'Review Reports for children in levels for extended periods, children experiencing issues or any other factors. Any issues or children who have not graduated during the past 6 months can be highlighted for follow up during the session as well as discussing these with the specific teacher during the team huddle.  ', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Pre', description: 'Make any last minute teacher changes on Links', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Pre', description: 'Meet and greet teachers and conduct Team Huddle focussing on Weekly Teaching Focuses and upcoming events and training ', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Pre', description: 'Assign trainees to mentor or senior teachers', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Pre', description: 'Teachers in water prior to start time', site_id: 1, session_time: 'pm')

GenericChecklist.create(title: 'Post', description: 'Have teachers help to set up for PM/next session, or if pool to be used during the break, to store equipment', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Post', description: 'Meet with teachers to give feedback from Team Leader Report or discuss any compliments or issues raised by parents during the shift. Compliments should be followed up with a Feedback Card in their pigeon hole.', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Post', description: 'Check toilets and surrounds for rubbish, lost property or any safety hazards that may have arisen during the shift and bring to the attention of the Manager', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Post', description: 'Take down Team Leader sign from board', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Post', description: 'Check with Customer Service Team about any issues that may have arisen during the shift', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Post', description: 'Indicate on Pool Deck Team Leader Report any variations to the teaching shift, e.g. teachers who started late, or finished shift early due to non-attendance.s sheet. This allows Managers to confirm Zuus shifts more easily.', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Post', description: 'Ensure any last minute teacher absences for the following shift have been covered', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Post', description: 'Complete Team Leader Report and file for Coordinator review', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Post', description: 'Update Student Tracking Form on the computer for next session', site_id: 1, session_time: 'pm')
GenericChecklist.create(title: 'Post', description: 'Print out teacher timetables, Team Leader report and Student Tracking Form for the next shift. If using SwimDesk, make sure all notes are up to date and tablet is put on the charger.', site_id: 1, session_time: 'pm')

redirect_to root_path
  end



  def tester
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
	   	@find_teacher = User.where(email: "#{link.TeachGivenNames.downcase}.#{link.TeachSurname.downcase}@rackleyswimming.com.au").last
 	  	if @find_teacher.blank?
	 	  	@find_teacher = User.new(
	 	  		email: "#{link.TeachGivenNames.downcase}.#{link.TeachSurname.downcase}@rackleyswimming.com.au",
	 	  		password: "Rackley!23",
	 	  		password_confirmation: "Rackley!23",
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
	 	  	@find_teacher.save
	 	else
	 		@find_teacher = @find_teacher
	 	end


	  	find_lesson = Lesson.find_or_create_by(
	  		start_time: @time_reformat,
	  		user_id: @find_teacher.id,
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


