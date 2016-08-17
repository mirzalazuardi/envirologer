class AqmeshChannel < ActiveRecord::Base
  belongs_to :aqmesh_datum

  def self.latest_final_by_label(n,label)
    where("label = ?",label.upcase).last(n).map(&:final)  
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
