class PrepareDataChart
  def latest(n,label)
    result    = []
    timestamp = AqmeshDatum.latest_timestamp(n)
    label.each do |x|
      pradata   = {}
      pradata[:name] = x
      val            = AqmeshChannel.latest_final_by_label(n,x)
      pradata[:data] = arrays_to_hash(timestamp,val)
      result << pradata
    end
    result
  end

  def arrays_to_hash(keys,values)
    Hash[keys.zip(values)]
  end
end
