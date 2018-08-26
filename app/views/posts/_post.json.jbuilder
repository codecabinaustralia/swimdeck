json.extract! post, :id, :student_id, :user_id, :clients, :body, :created_at, :updated_at
json.url post_url(post, format: :json)
