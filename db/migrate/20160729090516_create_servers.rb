class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :servers, :name, unique: true
  end
end
