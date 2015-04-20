json.array!(@plants) do |plant|
  json.extract! plant, :id, :name, :race, :age, :height, :temperature, :humidity_soil, :humidity_air, :light_degree, :health_factor, :image, :description
  json.url plant_url(plant, format: :json)
end
