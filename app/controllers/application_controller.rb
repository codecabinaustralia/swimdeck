class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  

  protected  

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      if current_user.client == true
        @client = Client.where(user_id: current_user.id).last
        client_path(@client)
    	else
        root_path
      end
    else
      	stored_location_for(resource) || request.referer || root_path
    end
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :first_name, :last_name, :admin, :manager, :pool_deck_leader, :teacher, :customer_service, :client])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :first_name, :last_name, :admin, :manager, :pool_deck_leader, :teacher, :customer_service, :client])
  end
end
