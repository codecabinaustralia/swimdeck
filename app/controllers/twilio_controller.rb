class TwilioController < ApplicationController
  def webhook

  	@client = Client.where(phone_1: params['From']).last
  	@body = params["Body"]

  	@client_students = ClientStudent.where(client_id: @client.id).all.pluck(:student_id)
  	@students = Student.where(id: @client_students).all

  	@students.each do |student|
	  	@post = Post.new(
	  			body: "SMS REPLY FROM #{@client.user.full_name} - #{@body}",
	  			note: true,
	  			sms: true,
	  			student_id: student.id,
	  			user_id: @client.user_id
	  			)
	    @post.save!
	end

  	#Respond 200
  	head :ok

  end

  def voice
  	@client = Client.where(phone_1: params["From"]).last
  	if @client.present?
  	@students = ClientStudent.where(client_id: @client.id).all

  	@a = ClientStudent.where(client_id: @client.id).first
  	@b = ClientStudent.where(client_id: @client.id).last

  	@student1 = Student.find(@a.student_id)
  	@student2 = Student.find(@b.student_id)
 	end

  	require 'twilio-ruby'

  	if @client.present?
	  	if @students.count < 2
	  		response = Twilio::TwiML::VoiceResponse.new
	  		    response.say("Hi this is rackley swimming, how are you", voice: 'man', language: 'en')
	  		    response.pause(length: 1)
	  		    response.say("We hope #{@student1.first_name} is doing well", voice: 'man', language: 'en')
	  		    response.pause(length: 1)
	  		    response.say("We are all in the pool at the moment.", voice: 'man', language: 'en')
	  		    render xml: response.to_s
	  		puts response
	  	else
	  	response = Twilio::TwiML::VoiceResponse.new
	  	    response.say("Hi this is rackley swimming, how are you", voice: 'man', language: 'en')
	  	    response.pause(length: 1)
	  	    response.say("We hope #{@student1.first_name} and #{@student2.first_name} are doing well", voice: 'man', language: 'en')
	  	    response.pause(length: 1)
	  	    response.say("We are all in the pool at the moment.", voice: 'man', language: 'en')
	  	    render xml: response.to_s
	  	puts response
	  	end
	  else
	  	response = Twilio::TwiML::VoiceResponse.new
	  	    response.say("Hi this is Rackley swimming, how are you", voice: 'man', language: 'en')
	  	    response.pause(length: 1)
	  	    response.say("please sit site while we redirect you to our head office.", voice: 'man', language: 'en')
	  	    response.dial(number: '+61437538848')
	  	    response.say('Goodbye')
	  	    render xml: response.to_s
	  	puts response
	
	  end
  end

end
