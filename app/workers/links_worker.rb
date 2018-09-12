class LinksWorker

  include Sidekiq::Worker
  sidekiq_options retry:false
  require 'time'
  require 'date'

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
		data = row.split("|")
  		    
  	  		new_link = Link.create(
  		  		StuSurname: data.values_at(0).strip.join('')
  		  		StuGivenNames: data.values_at(1).strip.join('')
  		  		StudId: data.values_at(2).strip.join('')
  		  		LessonDay: data.values_at(3).strip.join('')
  		  		LessonTime: data.values_at(4).strip.join('')
  		  		LessonLevel: data.values_at(5).strip.join('')
  		  		Area: data.values_at(6).strip.join('')
  		  		TeachSurname: data.values_at(7).strip.join('')
  		  		TeachGivenNames: data.values_at(8).strip.join('')
  		  		StuBookStartDate: data.values_at(9).strip.join('')
  		  		RPSurname: data.values_at(10).strip.join('')
  		  		RPGivenNames: data.values_at(11).strip.join('')
  		  		RPId: data.values_at(12).strip.join('')
  		  		RPAddress: data.values_at(13).strip.join('')
  		  		RPSuburb: data.values_at(14).strip.join('')
  		  		RPPostCode: data.values_at(15).strip.join('')
  		  		RPHomePhone: data.values_at(16).strip.join('')
  		  		RPWorkPhone: data.values_at(17).strip.join('')
  		  		RPPhone: data.values_at(18).strip.join('')
  		  		RPEmail: data.values_at(19).strip.join('')
  		  		RPBookingBalance: data.values_at(20).strip.join('')
  		  		RPBookingFee: data.values_at(21).strip.join('')
  		  		FamilyPaymentType: data.values_at(22).strip.join('')
  		  		SpecialDiscount: data.values_at(23).strip.join('')
  		  		RP: data.values_at(24).strip.join('')
  		  		StuGender: data.values_at(25).strip.join('')
  		  		StuDateOfBirth: data.values_at(26).strip.join('')
  		  		StuAge: data.values_at(27).join('')
  	  		)
        
  	end

    

  end
end
