json.extract! push_checklist, :id, :title, :description, :manager_id, :user_id, :site_id, :date_issued, :completed, :created_at, :updated_at
json.url push_checklist_url(push_checklist, format: :json)
