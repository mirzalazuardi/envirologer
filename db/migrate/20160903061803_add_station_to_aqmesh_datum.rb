class AddStationToAqmeshDatum < ActiveRecord::Migration
  def change
    add_reference :aqmesh_data, :station, index: true, foreign_key: true
  end
end
