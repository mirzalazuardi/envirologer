class AqmeshChannelsController < ApplicationController
  before_action :set_aqmesh_channel, only: [:show, :edit, :update, :destroy]

  # GET /aqmesh_channels
  # GET /aqmesh_channels.json
  def index
    @aqmesh_channels = AqmeshChannel.all
  end

  # GET /aqmesh_channels/1
  # GET /aqmesh_channels/1.json
  def show
  end

  # GET /aqmesh_channels/new
  def new
    @aqmesh_channel = AqmeshChannel.new
  end

  # GET /aqmesh_channels/1/edit
  def edit
  end

  # POST /aqmesh_channels
  # POST /aqmesh_channels.json
  def create
    @aqmesh_channel = AqmeshChannel.new(aqmesh_channel_params)

    respond_to do |format|
      if @aqmesh_channel.save
        format.html { redirect_to @aqmesh_channel, notice: 'Aqmesh channel was successfully created.' }
        format.json { render :show, status: :created, location: @aqmesh_channel }
      else
        format.html { render :new }
        format.json { render json: @aqmesh_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aqmesh_channels/1
  # PATCH/PUT /aqmesh_channels/1.json
  def update
    respond_to do |format|
      if @aqmesh_channel.update(aqmesh_channel_params)
        format.html { redirect_to @aqmesh_channel, notice: 'Aqmesh channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @aqmesh_channel }
      else
        format.html { render :edit }
        format.json { render json: @aqmesh_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aqmesh_channels/1
  # DELETE /aqmesh_channels/1.json
  def destroy
    @aqmesh_channel.destroy
    respond_to do |format|
      format.html { redirect_to aqmesh_channels_url, notice: 'Aqmesh channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aqmesh_channel
      @aqmesh_channel = AqmeshChannel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aqmesh_channel_params
      params.require(:aqmesh_channel).permit(:aqmesh_datum_id, :pre_scaled, :scaled, :final, :offset, :slope, :status, :unit, :sensor, :label)
    end
end
