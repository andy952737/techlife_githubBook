# for Rails 7.0.3.1, Ruby 3.0.0 

# gem install: 
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-delayed-job', '~> 1.0'
  gem 'capistrano-rails' #, :group => :development
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano-passenger'
  gem 'capistrano-yarn' 
  gem 'capistrano3-puma'

# cap install

# Capfile file add: 
  ```
# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or  
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
  
# Include for rvm
require "capistrano/rvm"    

# Include for bundler
require "capistrano/bundler"    

# Include for rails 
require "capistrano/rails"    

# Include for rails migratons
require "capistrano/rails/migrations"

# Include for passenger 
require "capistrano/passenger"  
 
# Include for yarn
require 'capistrano/yarn' 

# Include for rails assets:precompile
require "capistrano/rails/assets" 

# Include for rails assets:precompile
# require "capistrano/foreman" 

# Default settings
# set :foreman_use_sudo, false # Set to :rbenv for rbenv sudo, :rvm for rvmsudo or true for normal sudo
# set :foreman_roles, :all
# set :foreman_init_system, 'upstart'
# set :foreman_export_path, ->{ File.join(Dir.home, '.init') }
# set :foreman_app, -> { fetch(:application) }
# set :foreman_app_name_systemd, -> { "#{ fetch(:foreman_app) }.target" }
# set :foreman_options, ->{ {
#   app: application,
#   log: File.join(shared_path, 'log')
# } } 

# Include for delayed_job 
#require 'capistrano/delayed_job'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
  ```

# config/deploy.rb add: (自定義名稱自己改)
  ```
lock "~> 3.17.1"

set :application, "project_name"
set :repo_url, "git@github.com:user_name/project_name.git"

set :branch, ENV["REVISION"] || ENV["BRANCH_NAME"] || "main"      
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')    
set :linked_dirs, fetch(:linked_dirs, []).push('log','public/uploads', 'tmp/pids', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle')  
set :passenger_restart_with_touch, true       
set :deploy_to, '/home/user_name/project_name'      
set :rails_env, "production"               
set :rvm_type, :user_name      
set :rvm_ruby_version, '3.0.0'  
set :keep_releases, 5

namespace :deploy do 
    namespace :check do 
      before :linked_files, :set_master_key do
        on roles(:app), in: :sequence, wait: 10 do
          unless test("[ -f #{shared_path}/config/master.key ]")
            upload! 'config/master.key', "#{shared_path}/config/master.key"
          end
        end
      end 
    end
end
  ```


