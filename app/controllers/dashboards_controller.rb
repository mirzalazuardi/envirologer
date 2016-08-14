class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chart_data

  def index

    @channels = AqmeshDatum.last.aqmesh_channels
  end

  def latest_chart_data

    render json: @chartdata
  end

  def latest_chart_channel_component_data
    label       = ["#{params[:component].upcase}"]
    data        = PrepareDataChart.new
    result  = data.latest(20,label)
    render json: result
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chart_data
      label       = ['NO','NO2','CO','SO2','O3','TEMP','AP','HUM']
      data        = PrepareDataChart.new
      @chartdata  = data.latest(20,label) 
      @latest_channels   = AqmeshDatum.last.aqmesh_channels
    end

end
