json.array!(@planters) do |planter|
  json.extract! planter, :id, :brief_desc
  json.url planter_url(planter, format: :json)
end
