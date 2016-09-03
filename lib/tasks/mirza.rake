namespace :mirza do
  desc "rutin ambil 1 data"
  task get_latest_data: :environment do
    g = Grab.new
    stations = Station.all
    stations.each do |station|  
      server_num = station.server.number
      station_num = station.number
      station_id = station.id
      data = g.getapi("stationdata/latest/#{server_num}/#{station_num}/1")
      g.aqmeshdata_to_db(data,station_id)
    end
  end
  
  desc "pertama ambil data, 50"
  task first_take: :environment do
    g = Grab.new
    stations = Station.all
    stations.each do |station|  
      server_num = station.server.number
      station_num = station.number
      station_id = station.id
      count = 50
      data = g.getapi("stationdata/latest/#{server_num}/#{station_num}/#{count}")
      g.aqmeshdata_to_db(data,station_id)
    end
  end

end
