class AqmeshDataController < ApplicationController
  before_action :set_aqmesh_datum, only: [:show, :edit, :update, :destroy]

  # GET /aqmesh_data
  # GET /aqmesh_data.json
  def index
    @aqmesh_data = AqmeshDatum.all
  end

  # GET /aqmesh_data/1
  # GET /aqmesh_data/1.json
  def show
  end

  # GET /aqmesh_data/new
  def new
    @aqmesh_datum = AqmeshDatum.new
  end

  # GET /aqmesh_data/1/edit
  def edit
  end

  # POST /aqmesh_data
  # POST /aqmesh_data.json
  def create
    @aqmesh_datum = AqmeshDatum.new(aqmesh_datum_params)

    respond_to do |format|
      if @aqmesh_datum.save
        format.html { redirect_to @aqmesh_datum, notice: 'Aqmesh datum was successfully created.' }
        format.json { render :show, status: :created, location: @aqmesh_datum }
      else
        format.html { render :new }
        format.json { render json: @aqmesh_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aqmesh_data/1
  # PATCH/PUT /aqmesh_data/1.json
  def update
    respond_to do |format|
      if @aqmesh_datum.update(aqmesh_datum_params)
        format.html { redirect_to @aqmesh_datum, notice: 'Aqmesh datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @aqmesh_datum }
      else
        format.html { render :edit }
        format.json { render json: @aqmesh_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aqmesh_data/1
  # DELETE /aqmesh_data/1.json
  def destroy
    @aqmesh_datum.destroy
    respond_to do |format|
      format.html { redirect_to aqmesh_data_url, notice: 'Aqmesh datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def grab
    items = getapi('stationdata/latest/150/67/1')
    @items = items

    @items.each do |e|
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
      datum_item = AqmeshDatum.create!(timestamp: timestamp, display_type: display_type, battery: battery, particle_protocol: particle_protocol, gas_protocol: gas_protocol, P1: p1, P2: p2, P3: p3, T1: t1, T2: t2, T3: t3)
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
        
        AqmeshChannel.create!(aqmesh_datum_id: datum_item.id,pre_scaled: pre_scaled, scaled: scaled, final: final, offset: offset, slope: slope, status: status, unit: unit, sensor: sensor, label: label)
      end
      p '==========================saved============================'
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aqmesh_datum
      @aqmesh_datum = AqmeshDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aqmesh_datum_params
      params.require(:aqmesh_datum).permit(:timestamp, :display_type, :battery, :particle_protocol, :gas_protocol, :P1, :P2, :P3, :T1, :T2, :T3)
    end
end
