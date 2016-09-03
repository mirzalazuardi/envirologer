class CreateRoleGroups < ActiveRecord::Migration
  def change
    create_table :role_groups do |t|
      t.string :name
      t.references :role, index: true, foreign_key: true
      t.references :station, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
