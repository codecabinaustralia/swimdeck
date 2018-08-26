json.extract! client, :id, :user_id, :first_name, :last_name, :phone_1, :phone_2, :address, :address_city, :address_state, :address_postcode, :created_at, :updated_at
json.url client_url(client, format: :json)
