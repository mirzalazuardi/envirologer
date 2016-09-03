class Server < ActiveRecord::Base
  has_many :stations
  validates :name, uniqueness: true
  validates :number, uniqueness: true
end
