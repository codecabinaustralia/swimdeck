class DataScraperController < ApplicationController
  require 'csv'
  require 'open-uri'
  require 'date'

  def csv_spider

  end

  def add_links_data

  	require 'net/ftp'
	ftp = Net::FTP.new
	ftp.connect("203.13.68.170",21)
	ftp.login("swimdesk@ftp.cityvenuemanagement.com.au","Axs4swim")
	ftp.chdir("/")
	ftp.passive = true
	ftp.getbinaryfile("CEN_SCHOOL.csv", "tmp_path")

  	csv_text = open("tmp_path")
	csv = CSV.parse(csv_text, :headers=>true)

	csv.each do |row|
		data = row[0].split("|")
		@found_data = Link.where(StudId: data.values_at(2)).where(LessonDay: data.values_at(3)).where(LessonTime: data.values_at(4)).last
  		if @found_data.present?
  		@found_data.update_attributes(
	  		StuSurname: data.values_at(0).join(''),
	  		StuGivenNames: data.values_at(1).join(''),
	  		StudId: data.values_at(2).join(''),
	  		LessonDay: data.values_at(3).join(''),
	  		LessonTime: data.values_at(4).join(''),
	  		LessonLevel: data.values_at(5).join(''),
	  		Area: data.values_at(6).join(''),
	  		TeachSurname: data.values_at(7).join(''),
	  		TeachGivenNames: data.values_at(8).join(''),
	  		StuBookStartDate: data.values_at(9).join(''),
	  		RPSurname: data.values_at(10).join(''),
	  		RPGivenNames: data.values_at(11).join(''),
	  		RPId: data.values_at(12).join(''),
	  		RPAddress: data.values_at(13).join(''),
	  		RPSuburb: data.values_at(14).join(''),
	  		RPPostCode: data.values_at(15).join(''),
	  		RPHomePhone: data.values_at(16).join(''),
	  		RPWorkPhone: data.values_at(17).join(''),
	  		RPPhone: data.values_at(18).join(''),
	  		RPEmail: data.values_at(19).join(''),
	  		RPBookingBalance: data.values_at(20).join(''),
	  		RPBookingFee: data.values_at(21).join(''),
	  		FamilyPaymentType: data.values_at(22).join(''),
	  		SpecialDiscount: data.values_at(23).join(''),
	  		RP: data.values_at(24).join(''),
	  		StuGender: data.values_at(25).join(''),
	  		StuDateOfBirth: data.values_at(26).join(''),
	  		StuAge: data.values_at(27)
  		)
  		else
  	  		Link.create(
  		  		StuSurname: data.values_at(0).join(''),
  		  		StuGivenNames: data.values_at(1).join(''),
  		  		StudId: data.values_at(2).join(''),
  		  		LessonDay: data.values_at(3).join(''),
  		  		LessonTime: data.values_at(4).join(''),
  		  		LessonLevel: data.values_at(5).join(''),
  		  		Area: data.values_at(6).join(''),
  		  		TeachSurname: data.values_at(7).join(''),
  		  		TeachGivenNames: data.values_at(8).join(''),
  		  		StuBookStartDate: data.values_at(9).join(''),
  		  		RPSurname: data.values_at(10).join(''),
  		  		RPGivenNames: data.values_at(11).join(''),
  		  		RPId: data.values_at(12).join(''),
  		  		RPAddress: data.values_at(13).join(''),
  		  		RPSuburb: data.values_at(14).join(''),
  		  		RPPostCode: data.values_at(15).join(''),
  		  		RPHomePhone: data.values_at(16).join(''),
  		  		RPWorkPhone: data.values_at(17).join(''),
  		  		RPPhone: data.values_at(18).join(''),
  		  		RPEmail: data.values_at(19).join(''),
  		  		RPBookingBalance: data.values_at(20).join(''),
  		  		RPBookingFee: data.values_at(21).join(''),
  		  		FamilyPaymentType: data.values_at(22).join(''),
  		  		SpecialDiscount: data.values_at(23).join(''),
  		  		RP: data.values_at(24).join(''),
  		  		StuGender: data.values_at(25).join(''),
  		  		StuDateOfBirth: data.values_at(26).join(''),
  		  		StuAge: data.values_at(27).join('')
  	  		)
  		end
  	end
  	redirect_to root_path
  end

  def add_lessons

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
		  	begin
		  	   @dob = Date.parse(link.StuDateOfBirth.to_date.strftime("%Y-%m-%d"))
		  	rescue ArgumentError
		  	   @dob = nil
		  	end
	  	end

	  	#@lesson_start = link.StuBookStartDate.to_date.strftime("%Y-%m-%d") + " " + link.LessonTime.to_time.strftime("%I:%M:00")
	  	@newdate  = Date.today
		@deltadate = Date.today
		@lesson_start = Date.today.strftime("%Y-%m-%d") + " " + link.LessonTime.to_time.strftime("%I:%M:00")

	  	@time_reformat = @lesson_start.to_date.strftime("%Y-%m-%d %I:%M%p")
	  	@lesson_finish = @time_reformat

	  	#Add Teacher User
	   	#Create User/Client/Parent Login
	   	@teacher = User.where(last_name: link.TeachSurname).where(first_name: link.TeachGivenNames).last

	   	if @teacher.blank?
	 	  	t_user = User.new(
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
	 	  	t_user.save
	 	else
	 		t_user = @teacher
	 	end


	  	@find_lesson = Lesson.where(
	  		start_time: @lesson_start
	  		).where(
	  		finish_time: @lesson_finish
	  		).where(
	  		user_id: t_user.id #Teacher
	  		).where(
	  		site_id: 5 #Site
	  		).where(
	  		level_id: @current_level,
	  		).last
	  	if @find_lesson.blank?
	  		lesson = Lesson.create(
		  		start_time: Date.today,
		  		finish_time: Date.today,
		  		user_id: 1, #Teacher placeholder 3
		  		site_id: 1, #Site placeholder 1
		  		level_id: @current_level,
	  		)
	  	end

	  	@find_student = Student.where(
	  		first_name: link.StuGivenNames).where(
	  		last_name: link.StuSurname).where(
	  		dob: @dob).where(
	  		personal_notes: 1).where(
	  		current_level: @current_level
	  		).last
	  	if @find_student.blank?
	  	student = Student.create(
	  		first_name: link.StuGivenNames,
	  		last_name: link.StuSurname,
	  		dob: @dob,
	  		personal_notes: 1,
	  		current_level: @current_level,
	  		)
	  	else
	  	student = @find_student
	  	end

	  	# LESSON PARTICPANT
	  	require 'securerandom'
	  	@random_string = SecureRandom.hex

	  	@lesson_participant = LessonParticipant.where(
	  		lesson_id: lesson.id).where(
	  		student_id: student.id
	  	).last

	  	if @lesson_participant.blank?
		  	lesson_participant = LessonParticipant.create(
		  		lesson_id: lesson.id,
		  		student_id: student.id,
		  		random_string: @random_string
		  	)
		else
			lesson_participant = @lesson_participant
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
			user_id: c_user.id).where(
			first_name: link.RPGivenNames).where(
			last_name: link.RPSurname).where(
			phone_1: link.RPPhone).where(
			phone_2: link.RPWorkPhone).where(
			address: link.RPAddress).where(
			address_city: link.RPSuburb).where(
			address_state: "QLD").where(
			address_postcode: link.RPPostCode).last
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
			client = @find_client
		end

		#Attach user to student
		@find_parent = ClientStudent.where(
			client_id: client.id).where(
	  		student_id: student.id).last
	  	if @find_parent.blank?
			parent = ClientStudent.find_or_create_by(
		  		client_id: client.id,
		  		student_id: student.id
		  	)
		end

	end
	end
	redirect_to data_scraper_add_skills_path
  end

  def add_skills
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


