class AqmeshChannel < ActiveRecord::Base
  belongs_to :aqmesh_datum

  def self.latest_final_by_label(n,label)
    where("label = ?",label.upcase).last(n).map(&:final)  
  end
end
