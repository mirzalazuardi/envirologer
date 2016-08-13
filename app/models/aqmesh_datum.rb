class AqmeshDatum < ActiveRecord::Base
  has_many :aqmesh_channels
  validates :timestamp, uniqueness: true

  def self.latest_timestamp(n) 
    last(n).map(&:timestamp)
  end
  
end
