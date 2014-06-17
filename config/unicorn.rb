APP_PATH = "/usr/share/nginx/usergorilla-uscst1/current"

worker_processes 4
preload_app true
timeout 180
listen 3000



pid "#{APP_PATH}/tmp/pids/unicorn.pid"


after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end
