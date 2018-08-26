Rails.application.routes.draw do
  get 'twilio/webhook'
  #Twilio test
  get 'twilio/voice'
  
  get 'inbox' => 'inbox#inbox'
  resources :comments
  resources :posts do 
    get 'close_note'
  end
  resources :tasks do 
    patch 'complete_task' => 'user_profiles#complete_task'
  end
  get 'user_profiles/admin'
  get 'user_profiles/manager'
  get 'user_profiles/teacher'
  get 'user_profiles/pool_deck_leader'
  get 'user_profiles/customer_service'
  get 'user_profiles/client'

  get 'data_scraper/csv_spider'
  get 'data_scraper/add_links_data'
  get 'data_scraper/add_lessons'
  get 'data_scraper/add_skills'

  get 'daily_planner' => 'planner#daily_planner'

  resources :flags

  resources :lessons do 
    patch 'bulk_update_skills' => 'students#bulk_update_skills'
  end
  resources :students do
    patch 'update_student_skills' => 'students#update_student_skills'
  end
  resources :clients
  resources :sites
  resources :push_checklists
  resources :generic_checklists do 
    get 'check_list' => 'generic_checklists#check_list'
  end

  devise_for :users
  get 'static/home'
  resources :competency_levels
  resources :skills
  resources :levels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static#home"
end
