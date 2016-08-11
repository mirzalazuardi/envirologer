class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chart_data

  def index

    @channels = AqmeshDatum.last.aqmesh_channels
  end

  def latest_chart_data

    render json: @chartdata
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chart_data
      label       = ['no','no2','co','so2','o3','temp','ap','hum']
      data        = PrepareDataChart.new
      @chartdata  = data.latest(5,label)
    end

end
