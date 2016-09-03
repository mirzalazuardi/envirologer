class Role < ActiveRecord::Base
  has_many :users
  has_many :role_groups
end
