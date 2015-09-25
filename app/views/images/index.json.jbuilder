json.array!(@images) do |image|
  json.extract! image, :id, :imageable_id, :imageable_type, :avatar
  json.url image_url(image, format: :json)
end
