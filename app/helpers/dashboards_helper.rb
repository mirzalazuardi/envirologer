module DashboardsHelper
  def set_min_max_from(highest_num,count_part,part)
    comp   = {}
    p         = highest_num / count_part
    comp['min'] = p * (part-1) 
    comp['max'] = p * part 
    comp
  end

  def set_indicator_for(*args)
    label,value = *args

    if label.upcase == 'O3'
      indicator_color(value,51,101,169,209,748)
    elsif label.upcase == 'SO2'
      indicator_color(value,41,81,381,801,1600)
    elsif label.upcase == 'CO' 
      indicator_color(value,1.1,2.1,10,17,34)
    elsif label.upcase == 'NO2' 
      indicator_color(value,41,81,181,281,400)
    end
  end

  def indicator_color(*args)
    value,kpi1,kpi2,kpi3,kpi4,kpi5 = args
    bad_to_good_color = ['black','purple','red','yellow','green','blue']

    case value
    when 0..(kpi1.to_i-1) then result = bad_to_good_color[5]
    when kpi1..(kpi2.to_i-1) then result = bad_to_good_color[4]
    when kpi2..(kpi3.to_i-1) then result = bad_to_good_color[3]
    when kpi3..(kpi4.to_i-1) then result = bad_to_good_color[2]
    when kpi4..(kpi5.to_i-1) then result = bad_to_good_color[1] 
    else 
      result = bad_to_good_color[0]
    end
    result
  end
end
