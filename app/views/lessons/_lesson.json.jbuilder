json.extract! lesson, :id, :start_time, :finish_time, :user_id, :site_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
