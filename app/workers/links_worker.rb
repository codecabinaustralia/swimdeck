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
  		    
  	  		new_link = Link.new(
  		  		StuSurname: data.values_at(0).join('').tr_s('"', '').strip
  		  		StuGivenNames: data.values_at(1).join('').tr_s('"', '').strip
  		  		StudId: data.values_at(2).join('').tr_s('"', '').strip
  		  		LessonDay: data.values_at(3).join('').tr_s('"', '').strip
  		  		LessonTime: data.values_at(4).join('').tr_s('"', '').strip
  		  		LessonLevel: data.values_at(5).join('').tr_s('"', '').strip
  		  		Area: data.values_at(6).join('').tr_s('"', '').strip
  		  		TeachSurname: data.values_at(7).join('').tr_s('"', '').strip
  		  		TeachGivenNames: data.values_at(8).join('').tr_s('"', '').strip
  		  		StuBookStartDate: data.values_at(9).join('').tr_s('"', '').strip
  		  		RPSurname: data.values_at(10).join('').tr_s('"', '').strip
  		  		RPGivenNames: data.values_at(11).join('').tr_s('"', '').strip
  		  		RPId: data.values_at(12).join('').tr_s('"', '').strip
  		  		RPAddress: data.values_at(13).join('').tr_s('"', '').strip
  		  		RPSuburb: data.values_at(14).join('').tr_s('"', '').strip
  		  		RPPostCode: data.values_at(15).join('').tr_s('"', '').strip
  		  		RPHomePhone: data.values_at(16).join('').tr_s('"', '').strip
  		  		RPWorkPhone: data.values_at(17).join('').tr_s('"', '').strip
  		  		RPPhone: data.values_at(18).join('').tr_s('"', '').strip
  		  		RPEmail: data.values_at(19).join('').tr_s('"', '').strip
  		  		RPBookingBalance: data.values_at(20).join('').tr_s('"', '').strip
  		  		RPBookingFee: data.values_at(21).join('').tr_s('"', '').strip
  		  		FamilyPaymentType: data.values_at(22).join('').tr_s('"', '').strip
  		  		SpecialDiscount: data.values_at(23).join('').tr_s('"', '').strip
  		  		RP: data.values_at(24).join('').tr_s('"', '').strip
  		  		StuGender: data.values_at(25).join('').tr_s('"', '').strip
  		  		StuDateOfBirth: data.values_at(26).join('').tr_s('"', '').strip
  		  		StuAge: data.values_at(27).join('')
  	  		)
        new_link.save
        
  	end

    

  end
end
