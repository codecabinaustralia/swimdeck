class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  require 'csv'
  require 'open-uri'
  require 'date'
  require 'time'

  before_action :set_variables

  def set_variables
   @activate_parent_sms = false

   @parent_info_flag = false #
   @no_skill_achieved_flag = true #
   @no_wall_activity_flag = false #
   @new_skill_achieved_flag = true #
   @ready_for_assesment_flag = true #
   @birthday_party_flag = true #
   @birthday_week_flag = true #

  end

  

  protected


  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url && current_user.client == true
      
        @client = Client.where(user_id: current_user.id).last
        client_path(@client)

    else
      	stored_location_for(resource) || request.referer || daily_planner_path
    end
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :first_name, :last_name, :admin, :manager, :pool_deck_leader, :teacher, :customer_service, :client])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :first_name, :last_name, :admin, :manager, :pool_deck_leader, :teacher, :customer_service, :client])
  end
end
