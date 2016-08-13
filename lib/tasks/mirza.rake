namespace :mirza do
  desc "TODO"
  task get_latest_data: :environment do
    g = Grab.new
    data = g.getapi('stationdata/latest/150/67/1')
    g.aqmeshdata_to_db(data)
  end

end
