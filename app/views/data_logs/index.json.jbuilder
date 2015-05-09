json.array!(@data_logs) do |data_log|
  json.extract! data_log, :id, :user_id, :plant_id, :humidity_soil, :humidity_air, :light, :temperature
  json.url data_log_url(data_log, format: :json)
end
