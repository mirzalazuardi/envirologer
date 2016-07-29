class Server < ActiveRecord::Base
  validates :name, uniqueness: true
end
