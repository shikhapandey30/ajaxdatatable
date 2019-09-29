json.extract! post, :id, :name, :first_name, :last_name, :address_string, :desc, :created_at, :updated_at
json.url post_url(post, format: :json)
