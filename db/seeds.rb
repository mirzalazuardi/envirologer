# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Server.create(id:150, name:"server1")
Station.create!(id:67, name:  "Demo Pod", serial_number:  "67150", server_id:  150, type:  "AQMeshPod", active:  true, external:  true, latitude:  52.20025, longitude:-1.72225  )
