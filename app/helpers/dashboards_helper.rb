module DashboardsHelper
  def set_min_max_from(highest_num,count_part,part)
    comp   = {}
    p         = highest_num / count_part
    comp['min'] = p * (part-1) 
    comp['max'] = p * part 
    comp
  end

  def indicator_color(*args)
    label = args[0]
    value = args[1]
    bad_to_good_color = ['black','red','yellow','green','blue']

    #if label.upcase == 'TEMP'
      #hn = 31
    #elsif label.upcase == 'HUM'
      #hn = 76
    #elsif label.upcase == 'AP'
      #hn = 1000
    #elsif label.upcase == 'O3'
      #hn = 22
    #elsif label.upcase == 'SO2'
      #hn = 500
    #elsif label.upcase == 'NO2'
      #hn = 20
    #elsif label.upcase == 'NO'
      #hn = 3
    #end
    hn = 1020

    case value
    when set_min_max_from(hn,5.0,5)['min']..set_min_max_from(hn,5,5)['max'] then result = bad_to_good_color[0]
    when set_min_max_from(hn,5.0,4)['min']..set_min_max_from(hn,5,4)['max'] then result = bad_to_good_color[1]
    when set_min_max_from(hn,5.0,3)['min']..set_min_max_from(hn,5,3)['max'] then result = bad_to_good_color[2]
    when set_min_max_from(hn,5.0,2)['min']..set_min_max_from(hn,5,2)['max'] then result = bad_to_good_color[3]
    when set_min_max_from(hn,5.0,1)['min']..set_min_max_from(hn,5,1)['max'] then result = bad_to_good_color[4] 
    end
    result
  end
end
