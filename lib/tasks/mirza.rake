namespace :mirza do
  desc "rutin ambil 1 data"
  task get_latest_data: :environment do
    g = Grab.new
    data = g.getapi('stationdata/latest/150/67/1')
    g.aqmeshdata_to_db(data)
  end
  
  desc "pertama ambil data, 50"
  task first_take: :environment do
    g = Grab.new
    data = g.getapi('stationdata/latest/150/67/50')
    g.aqmeshdata_to_db(data)
  end

end
