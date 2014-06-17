require 'bundler/capistrano'
require 'capistrano-unicorn'
set :bundle_cmd, "/home/unicorn/.rbenv/shims/bundle"
set :bundle_dir, "/home/unicorn/.rbenv/versions/2.0.0-p247/lib/ruby/gems/2.0.0/gems"
set :unicorn_rack_env, "production"




#set :whenever_command, "bundle exec whenever"
#require "whenever/capistrano"

set :application, "UserGorilla"
set :repository,  "git@github.com:lutix/usergorilla.git"

set :deploy_to, "/usr/share/nginx/usergorilla"

set :scm, :git
set :branch, "master"

set :user, "unicorn"
set :use_sudo, false

set :rails_env, "production"

set :deploy_via, :copy

set :ssh_options, { :forward_agent => true, :port => 22 }

set :keep_releases, 5

default_run_options[:pty] = true
default_run_options[:max_hosts] = 1

server "x.x.x.x", :app, :web, :db, :primary => true
server "x.x.x.x", :app, :web


after 'deploy:restart', 'unicorn:restart'   # app preloaded

after 'deploy:restart', 'deploy:reload_nginx'

after "deploy", "deploy:migrate"

namespace :deploy do
  task :reload_nginx, :roles => :web do
    run "sudo /etc/nginx/reload"
  end
end