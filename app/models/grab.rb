require 'open-uri'
class Grab
  
  def initialize
    uri    = "http://api.envirologger.net/2.0/interface/"
    apikey = "a7ea099c-E/7e9f-6a94-Qnu4-FtFD-BRPE-2srr-fc09-aae3/"
    @api   = uri.concat(apikey)
  end

  def getapi(q)
    fullapi = @api.concat(q)
    content = open(fullapi).read
    JSON.parse(content)
  end

  def aqmeshdata_to_db(g,id)

    g.each do |e|
      aqmdata = AqmeshDatum.new
      aqmdata.timestamp = e["Timestamp"]
      aqmdata.display_type = e["DisplayType"]
      aqmdata.battery = e["Battery"]
      aqmdata.particle_protocol = e["ParticleProtocol"]
      aqmdata.gas_protocol = e["GasProtocol"]
      aqmdata.P1 = e["P1"]
      aqmdata.P2 = e["P2"]
      aqmdata.P3 = e["P3"]
      aqmdata.T1 = e["T1"]
      aqmdata.T2 = e["T2"]
      aqmdata.T3 = e["T3"]
      aqmdata.station_id = id

      if aqmdata.save 

        e["Channels"].each do |f| 
          pre_scaled = f["PreScaled"]
          scaled     = f["Scaled"]
          final      = f["Final"]
          offset     = f["Offset"]
          slope      = f["Slope"]
          status     = f["Status"]
          unit       = f["Unit"]
          sensor     = f["Sensor"]
          label      = f["Label"]
          
          AqmeshChannel.create!(aqmesh_datum_id: aqmdata.id,pre_scaled: pre_scaled, scaled: scaled, final: final, offset: offset, slope: slope, status: status, unit: unit, sensor: sensor, label: label.strip) 
        end

        p "========================= saved #{e['Timestamp']} ==========================="

      else 
        p "xxxxxxxxxxxxxxxxxxxxxxxxxx skipped #{e['Timestamp']} xxxxxxxxxxxxxxxxxxxxxxxx" 
      end

    end

  end

end
