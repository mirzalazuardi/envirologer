class RoleGroup < ActiveRecord::Base
  belongs_to :role
  belongs_to :station
end
