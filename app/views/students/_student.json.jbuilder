json.extract! student, :id, :first_name, :last_name, :dob, :personal_notes, :current_level, :created_at, :updated_at
json.url student_url(student, format: :json)
