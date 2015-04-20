json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :profile_photo, :cover_photo
  json.url profile_url(profile, format: :json)
end
