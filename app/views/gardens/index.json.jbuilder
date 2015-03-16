json.array!(@gardens) do |garden|
  json.extract! garden, :id, :profile_id, :name, :description, :location
  json.url garden_url(garden, format: :json)
end
