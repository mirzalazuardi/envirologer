class PublicvarsController < ApplicationController
  def latest
    dt = AqmeshDatum.last
    latest_value = dt.aqmesh_channels.map { |x| [x.label,x.final] } 
    @public_latest = {}
    @public_latest[:timestamp] = dt.timestamp
    @public_latest[:data] = latest_value
    render json: @public_latest
  end
end
