class AqmeshDatum < ActiveRecord::Base
  has_many :aqmesh_channels
  validates :timestamp, uniqueness: true
end
