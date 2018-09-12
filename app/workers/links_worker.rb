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
		data = row[0].split("|")
  		    
  	  		new_link = Link.new(
  		  		StuSurname: data.values_at(0).tr_s('"', '').strip.join('')
  		  		StuGivenNames: data.values_at(1).tr_s('"', '').strip.join('')
  		  		StudId: data.values_at(2).tr_s('"', '').strip.join('')
  		  		LessonDay: data.values_at(3).tr_s('"', '').strip.join('')
  		  		LessonTime: data.values_at(4).tr_s('"', '').strip.join('')
  		  		LessonLevel: data.values_at(5).tr_s('"', '').strip.join('')
  		  		Area: data.values_at(6).tr_s('"', '').strip.join('')
  		  		TeachSurname: data.values_at(7).tr_s('"', '').strip.join('')
  		  		TeachGivenNames: data.values_at(8).tr_s('"', '').strip.join('')
  		  		StuBookStartDate: data.values_at(9).tr_s('"', '').strip.join('')
  		  		RPSurname: data.values_at(10).tr_s('"', '').strip.join('')
  		  		RPGivenNames: data.values_at(11).tr_s('"', '').strip.join('')
  		  		RPId: data.values_at(12).tr_s('"', '').strip.join('')
  		  		RPAddress: data.values_at(13).tr_s('"', '').strip.join('')
  		  		RPSuburb: data.values_at(14).tr_s('"', '').strip.join('')
  		  		RPPostCode: data.values_at(15).tr_s('"', '').strip.join('')
  		  		RPHomePhone: data.values_at(16).tr_s('"', '').strip.join('')
  		  		RPWorkPhone: data.values_at(17).tr_s('"', '').strip.join('')
  		  		RPPhone: data.values_at(18).tr_s('"', '').strip.join('')
  		  		RPEmail: data.values_at(19).tr_s('"', '').strip.join('')
  		  		RPBookingBalance: data.values_at(20).tr_s('"', '').strip.join('')
  		  		RPBookingFee: data.values_at(21).tr_s('"', '').strip.join('')
  		  		FamilyPaymentType: data.values_at(22).tr_s('"', '').strip.join('')
  		  		SpecialDiscount: data.values_at(23).tr_s('"', '').strip.join('')
  		  		RP: data.values_at(24).tr_s('"', '').strip.join('')
  		  		StuGender: data.values_at(25).tr_s('"', '').strip.join('')
  		  		StuDateOfBirth: data.values_at(26).tr_s('"', '').strip.join('')
  		  		StuAge: data.values_at(27).join('')
  	  		)
        new_link.save
        
  	end

    

  end
end
