json.extract! user, :id, :userid, :name, :pass, :mail, :color, :call, :created_at, :updated_at
json.url user_url(user, format: :json)