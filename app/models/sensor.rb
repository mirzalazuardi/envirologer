class Sensor < ActiveRecord::Base
  validates :name, uniqueness: true
end
