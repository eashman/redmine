require 'rubygems'
require 'rake'
require 'rufus-scheduler'

load File.join(Rails.root, 'Rakefile')

ENV['host']='pop.zoho.com'
ENV['port']='995'
ENV['ssl']='SSL'
ENV['username']='atm@akariobl.com'
ENV['password']='redpass44'

scheduler = Rufus::Scheduler.new
# Check emails every 10 mins
scheduler.interval '2m' do
  task = Rake.application['redmine:email:receive_pop3']
  task.reenable
  task.invoke 
end

