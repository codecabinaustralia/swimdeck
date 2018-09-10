class LinksWorker

  include Sidekiq::Worker
  sidekiq_options retry:false

  def perform()
  	@link_data = Link.all
  	@link_data.destroy_all
  	
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

    @link_first = link.first
    @link_first.destroy

    @links = Link.all.group_by{|e| [e.TeachSurname, e.StuBookStartDate, e.LessonDay]}

    @links.each do |link|
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

      @lesson_start = DateTime.strptime("#{@new_date} #{link.LessonTime}", "%Y-%m-%d %-I:%M%p").strftime("%Y-%m-%d %-I:%M")

      Lesson.create(
        start_time: @lesson_start,
        finish_time: @lesson_start,
        user_id: t_user.id,
        site_id: 1,
        level_id: @current_level
      )



    end

      


  end
end
