class PublicvarsController < ApplicationController
  def latest
    station = Station.where(number: params[:station_number]).first
    dt = AqmeshDatum.where(station_id: station.id).last
    latest_value = dt.aqmesh_channels.map { |x| [x.label,"%4.2f %s" % [x.final,x.unit]] } 
    @public_latest = {}
    @public_latest[:timestamp] = dt.timestamp
    @public_latest[:latitude] = dt.station.latitude
    @public_latest[:longitude] = dt.station.longitude
    @public_latest[:city] = dt.station.city
    @public_latest[:country] = dt.station.country
    @public_latest[:data] = latest_value
    render json: @public_latest
  end
end
