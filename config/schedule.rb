# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

ENV.each { |k, v| env(k, v) }

# set logs and environment
set :output, {:standard => "#{path}/log/cron.log", :error => "#{path}/log/cron.log"}
set :environment, ENV['RAILS_ENV']

# Every 1 minute flush redis to the database. using small interval for the sake of proof of concept & easy of testing.
every 1.minute do
  rake 'batch:sync_counts_from_redis', :environment => 'development', output: 'log/cron.log'
end
