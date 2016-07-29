class Unit < ActiveRecord::Base
  validates :name, uniqueness: true
end
