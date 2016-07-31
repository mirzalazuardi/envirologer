class DashboardsController < ApplicationController
  def index
    idDatum = AqmeshDatum.last.id
    @channels = AqmeshChannel.find_by_aqmesh_datum_id(idDatum)
  end
end
