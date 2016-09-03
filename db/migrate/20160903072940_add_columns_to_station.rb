class AddColumnsToStation < ActiveRecord::Migration
  def change
    add_column :stations, :city, :string
    add_column :stations, :country, :string
  end
end
