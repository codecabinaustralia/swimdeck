class ControlRoomController < ApplicationController
before_action :authenticate_user!
  def cockpit
  	@client = Client.where(user_id: current_user.id).last
  	if @client.present?
  		redirect_to client_path(@client)
 	end
  end
end
