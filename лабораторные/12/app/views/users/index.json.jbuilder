json.array!(@users) do |user|
  json.extract! user, :id, :login, :pswd
  json.url user_url(user, format: :json)
end
