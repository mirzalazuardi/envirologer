class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index

    @channels = AqmeshDatum.last.aqmesh_channels
  end
end
