class HardWorker

  include Sidekiq::Worker
  sidekiq_options retry:false

  def perform()
  	
  	#First destroy the first line in links table -----------
  	@link_first = Link.first
  	@link_first.destroy

  	#Now group links data by lesson time and teacher
  	@links_lessons = Link.all

  	#Loop through these lessons and create a teacher and lesson
  	@links_lessons.each do |lesson|
  		#First create the teacher and their login
  		@teacher = User.where(email: "#{lesson.TeachSurname}.#{lesson.TeachFirstname}@rackleyswimming.com.au").last
  		if @teacher.blank?
  			@teacher = User.new(
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
  			@teacher.save
  		end


  		#Now the Lesson
  		#First we find the current level of each student
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
  		# Secondly we need to find the date of next StuBookStartDate
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
	  	# Now we need to merge that date with the LessonTime - we'llconvert this to a DateTime then format it accordingly
  		@lesson_start = DateTime.strptime("#{@new_date} #{lesson.LessonTime}", "%Y-%m-%d %I:%M%p").strftime("%Y-%m-%d %I:%M")
  		#Finally we create the lesson
  		@find_lesson = Lesson.where(start_time: @lesson_start).where(user_id: @teacher.id).last

  		if @find_lesson.blank?
	  		@lesson = Lesson.new(
			  		start_time: @lesson_start,
			  		user_id: @teacher.id,
			  		site_id: 1,
			  		level_id: @current_level,
	  			)
	  		@lesson.save
	  	else
	  		@lesson = @find_lesson
  		end

  	end

  end
end
