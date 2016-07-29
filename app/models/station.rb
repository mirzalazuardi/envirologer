class Station < ActiveRecord::Base
  self.inheritance_column = "inheritance_type"
  belongs_to :server
  validates :name, uniqueness: true
end
