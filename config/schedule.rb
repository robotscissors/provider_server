# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, {:standard=>'cron.log'}
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
# get the listing of all the providers
every 1.day, :at => '11:32am' do
  rake "scrape:from_the_sitemap", :environment => "development"
end


# get each profile
every 1.day, :at => '11:48am' do
  rake "scrape:get_the_profiles", :environment => "development"
end
