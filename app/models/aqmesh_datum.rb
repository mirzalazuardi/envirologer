class AqmeshDatum < ActiveRecord::Base
  has_many :aqmesh_channels
  validates :timestamp, uniqueness: true

  def self.grab_to_db(g)

    g.each do |e|
      timestamp = e["Timestamp"]
      display_type = e["DisplayType"]
      battery = e["Battery"]
      particle_protocol = e["ParticleProtocol"]
      gas_protocol = e["GasProtocol"]
      p1 = e["P1"]
      p2 = e["P2"]
      p3 = e["P3"]
      t1 = e["T1"]
      t2 = e["T2"]
      t3 = e["T3"]
      datum_item = create!(timestamp: timestamp, display_type: display_type, battery: battery, particle_protocol: particle_protocol, gas_protocol: gas_protocol, P1: p1, P2: p2, P3: p3, T1: t1, T2: t2, T3: t3)
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
        
        AqmeshChannel.create!(aqmesh_datum_id: datum_item.id,pre_scaled: pre_scaled, scaled: scaled, final: final, offset: offset, slope: slope, status: status, unit: unit, sensor: sensor, label: label.strip)
      end
      p '==========================saved============================'
    end
  end

  def self.latest_timestamp(n) 
    last(n).map(&:timestamp)
  end
  
end
