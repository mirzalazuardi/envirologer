class AddTimezoneToStations < ActiveRecord::Migration
  def change
    add_column :stations, :timezone, :string
  end
end
