class CreateAqmeshChannels < ActiveRecord::Migration
  def change
    create_table :aqmesh_channels do |t|
      t.references :aqmesh_datum, index: true, foreign_key: true
      t.float :pre_scaled
      t.float :scaled
      t.float :final
      t.float :offset
      t.float :slope
      t.float :status
      t.string :unit
      t.string :sensor
      t.string :label

      t.timestamps null: false
    end
  end
end
