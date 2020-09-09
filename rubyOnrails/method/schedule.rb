set :output, "log/cron_log.log"
env :PATH, ENV['PATH'] 
set :schedule, :developmentevery 1.day, at: '10:00' do
  rake "send_daily_mail:clear_expired_sessions" 
end