class DataScraperController < ApplicationController
  require 'csv'
  require 'open-uri'
  require 'date'
  require 'time'


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
  	links = Link.all
  	students = Student.all

  	HardWorker.perform_async()
	render text: "Performing sync now"
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

	redirect_to root_path

  end



end


