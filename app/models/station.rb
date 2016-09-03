class Station < ActiveRecord::Base
  self.inheritance_column = "inheritance_type"
  belongs_to :server
  has_many :aqmesh_data
  has_many :role_groups
  validates :name, uniqueness: true
  validates :number, uniqueness: true
end
