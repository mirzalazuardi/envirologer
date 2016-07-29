class CreateAqmeshData < ActiveRecord::Migration
  def change
    create_table :aqmesh_data do |t|
      t.string :timestamp
      t.string :display_type
      t.float :battery
      t.string :particle_protocol
      t.string :gas_protocol
      t.string :P1
      t.string :P2
      t.string :P3
      t.string :T1
      t.string :T2
      t.string :T3

      t.timestamps null: false
    end
    add_index :aqmesh_data, :timestamp, unique: true
  end
end
