json.array!(@users) do |user|
  json.extract! user, :id, :fist_name, :last_name, :email, :gender
  json.url user_url(user, format: :json)
end
