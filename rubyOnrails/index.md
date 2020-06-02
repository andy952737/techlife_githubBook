## RubyonRails Tech Coding Note      

# iOSX mac brew RVM ruby rails
> https://tingtinghsu.github.io/blog/articles/2019-01-24-rails_ruby_version_RVM
```
rvm install x.x.x
rvm use x.x.x --default
rvm -v
rvm install {安裝的元件}
rvm list know 
rvm instal ruby-x.x.x
gem list
gem install rails -v x.x.x.x
```

# install ruby版本狀態 - 進階 
> 2020/6/2
``` 
rvm implode
\curl -sSL https://get.rvm.io | bash
rvm pkg install openssl
rvm install 2.3.1 --with-openssl-dir=$HOME/.rvm/usr
```
<https://github.com/rvm/rvm/issues/4607> 

# Rails Code
```
rake secret
rails secret
rake assets:precompile

rake db:data:dump
rake db:schema:load
rake db:data:load
 
RAILS_ENV=production rake db:create DISABLE_DATABASE_ENVIRONMENT_CHECK=1
RAILS_ENV={production} bundle install
rails s -e {production}

rails g migration add_name_to_admin_user:type
```

# 常用好用Gem
```
gem 'active_model_serializers', '~> 0.10.0’

controller
include ActionController::Serialization

rails g serializer {model}

class ModelSerializer < ActiveModel::Serializer
    attributes :id, :created_at, :updated_at
end 

gem 'whenever', require: false
wheneverize .
whenever - i
whenever - w
crontab -l 

gem ‘rmagick'  
include CarrierWave::RMagick 
version :thumb do
    process :resize_to_fit => [200, 200]
end
bytesToMegabytes = (bytes) ->
  return Math.round((b/1024/1024) * 100) / 100

bundle install
bundle update
rails c
rails s

rails new project_name
rails _6.0.1_ new project_name

rake log:clear
rake tmp:clear
rake db:drop
rake db:create
rake db:migrate
rake db:reset

rvm -v
rvm list
rvm list known
rvm x.x.x —default  

//優化rails c
gem 'pry', '~> 0.12.2'
gem 'pry-byebug', '~> 3.7'

//mysql版本問題 - 進階
gem uninstall mysql2 移除
gem install mysql2 -v 0.3.18 


```

# Rails raise Error處理機制
```
raise "An error has occurred"
```

# Rails+AJAX架構寫法 
> 以public controller為例 
```
views:
public/
	index.html.erb
	show.html.erb
	create.js.erb
	destroy.js.erb
	update.js.erb
```

# Remark
<https://github.com/yamldb/yaml_db>