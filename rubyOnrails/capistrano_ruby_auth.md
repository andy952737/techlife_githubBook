# Capistrano + Ruby on Rails自動化部屬

# 前置作業設定與安裝 .ssh
> 以下是Linux環境下的終端機, 拿著 id_rsa.pub 裡面的秘鑰 輸入到github-ssh裡面, 若有 Cloud Servcie也照做一次此步驟
```
cd ~
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub

created:
authorized_keys  
```

# use Capistrano SSH-Key 處理
```	
ssh-add -D
ssh-add -K ~/.ssh/id_rsa
```

# Cloud Service 連接 ssh-key
> Created authorized_keys, 把本地端的ssh-key貼到裡面
```
cd ~ 
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub

cd ~/.ssh
vim authorized_keys 
``` 

# rails project gem
```
gem 'ed25519', '~> 1.2' 
gem 'bcrypt_pbkdf', '~> 1'
gem 'capistrano' 
gem 'capistrano-rails', :group => :development
gem 'capistrano-passenger', :group => :development
gem 'capistrano-bundler'  
gem 'capistrano-rvm' 
gem 'capistrano-passenger', :group => :development
```

# 執行 capistrano
```
cap install
```

# 這時專案會在/config 底下新增 deploy.rb，其他個別環境會放在 config/deploy/production.rb, config/deploystaging.rb
> production 和 staging 名稱可以自定義

# Capfile設定檔
```
# Capfile
 
# Load DSL and set up stages
require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/rails"
require "capistrano/rails/migrations"
require "capistrano/scm/git"
require 'capistrano/rvm' 
install_plugin Capistrano::SCM::Git
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }

```

# Capistrano進階設定
```
# config/deploy/production.rb
server 'ip-addr', user: 'username', roles: %w{app db web}, my_property: :my_value

# config/deploy.rb
set :application, "project_name"   
set :repo_url, "git@github.com:username/githubproject.git"
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, '/home/andyk/www/dev-test' 
lock '3.13.0' 
set :keep_releases, 5
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/images', 'public/pano_files', 'public/tmp', 'public/pano_sample', 'pano_files', 'public/uimg', 'seed_files', 'public/audio') 
set :passenger_restart_with_touch, true 
```

# 執行 Capistrano 
> production 這是您的 /config/deploy/裡面的檔案 
```
cap production deploy:check
cap production deploy 
```

# 進階 Capistrano 處理
```
gem 'capistrano-rvm'

set :rails_env, "使用者"  
set :rvm_type, :username
set :rvm_ruby_version, '版本' 

Bug 
deploy:assets:precompile
...
SystemStackError: stack level too deep

```  
<https://itranslater.com/qa/details/2118101694134354944>

