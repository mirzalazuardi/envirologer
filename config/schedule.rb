# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
every 15.minutes do
  rake "mirza:get_latest_data"
  #g = Grab.new
  #data = g.getapi('stationdata/latest/150/67/1')
  #AqmeshDatum.grab_to_db(data)
  #MyClass.do_stuff
  #AqmeshDatum.grab
end
