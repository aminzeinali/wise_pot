json.array!(@bluetooth_devices) do |bluetooth_device|
  json.extract! bluetooth_device, :id, :user_id, :sampling_times, :location, :version, :status
  json.url bluetooth_device_url(bluetooth_device, format: :json)
end
