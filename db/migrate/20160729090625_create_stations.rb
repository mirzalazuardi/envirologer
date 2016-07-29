class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :serial_number
      t.references :server, index: true, foreign_key: true
      t.string :type
      t.boolean :active
      t.boolean :external
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
    add_index :stations, :name, unique: true
  end
end
