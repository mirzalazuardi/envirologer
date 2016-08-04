class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    idDatum = AqmeshDatum.last.id
    @channels = AqmeshChannel.find_by_aqmesh_datum_id(idDatum)
  end
end
