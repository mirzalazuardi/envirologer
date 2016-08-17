class AqmeshDatum < ActiveRecord::Base
  has_many :aqmesh_channels
  validates :timestamp, uniqueness: true

  def self.latest_timestamp(n) 
    last(n).map(&:timestamp)
  end
  
  def self.to_csv(col_sep)
    CSV.generate do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
