json.extract! station, :id, :name, :serial_number, :server_id, :type, :active, :external, :latitude, :longitude, :created_at, :updated_at
json.url station_url(station, format: :json)